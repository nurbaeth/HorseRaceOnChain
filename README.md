# 🐎 HorseRaceOnChain

**HorseRaceOnChain** is a fully on-chain horse racing game built with Solidity.  
No tokens, no bets — just decentralized fun for Web3 builders and curious minds.

---

## 🎮 Gameplay Overview

- 🧑‍🤝‍🧑 Up to **5 players** can join each race.
- 🐴 Each player picks a horse (numbered **1 to 5**). 
- 🏁 Once all 5 players have joined, the race **automatically starts**.
- 🎲 A **random winner** is chosen entirely on-chain using pseudo-random logic.
- 🔄 After the race, anyone can **reset** it for the next round.

> ⚠️ This game is for educational/demo purposes. Pseudo-randomness is not secure for production.

---

## 🔧 Smart Contract Features

- ✅ Pure Solidity (no external dependencies)
- ✅ No ETH/token transfers
- ✅ Gas-efficient design
- ✅ Easily extendable for more game mechanics

---

## 📦 Tech Stack

- **Solidity** `^0.8.20`
- Compatible with **Hardhat** or **Foundry**

---

## 📜 Contract Structure

| Function        | Description                            |
|----------------|----------------------------------------|
| `joinRace()`   | Join the race and pick a horse         |
| `resetRace()`  | Reset the race after it finishes       |
| `getPlayers()` | View current race participants         |
| `winner`       | Address of the race winner             |

---

## 🚀 Getting Started

### 🛠 Deploy with Hardhat

```bash
git clone https://github.com/your-username/HorseRaceOnChain.git
cd HorseRaceOnChain
npm install
npx hardhat compile
npx hardhat test
