// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HorseRaceOnChain {
    uint8 public constant MAX_PLAYERS = 5;
    uint8 public constant MAX_HORSES = 5;

    enum RaceState { Waiting, Ongoing, Finished }
    RaceState public raceState;

    address[] public players;
    mapping(address => uint8) public chosenHorse;
    address public winner;

    event PlayerJoined(address indexed player, uint8 horse);
    event RaceStarted();
    event RaceFinished(address indexed winner, uint8 horse);

    modifier inState(RaceState _state) {
        require(raceState == _state, "Invalid race state");
        _;
    }

    function joinRace(uint8 horse) external inState(RaceState.Waiting) {
        require(players.length < MAX_PLAYERS, "Race is full");
        require(horse >= 1 && horse <= MAX_HORSES, "Invalid horse number");
        require(chosenHorse[msg.sender] == 0, "Already joined");

        players.push(msg.sender);
        chosenHorse[msg.sender] = horse;

        emit PlayerJoined(msg.sender, horse);

        if (players.length == MAX_PLAYERS) {
            _startRace();
        }
    }

    function _startRace() internal {
        raceState = RaceState.Ongoing;
        emit RaceStarted();

        _finishRace();
    }

    function _finishRace() internal inState(RaceState.Ongoing) {
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players)));
        uint8 winnerIndex = uint8(rand % MAX_PLAYERS);
        winner = players[winnerIndex];

        raceState = RaceState.Finished;

        emit RaceFinished(winner, chosenHorse[winner]);
    }

    function resetRace() external inState(RaceState.Finished) {
        delete players;
        winner = address(0);
        raceState = RaceState.Waiting;

        for (uint8 i = 0; i < MAX_PLAYERS; i++) {
            address player = players[i];
            delete chosenHorse[player];
        }
    }

    function getPlayers() external view returns (address[] memory) {
        return players;
    }
}
