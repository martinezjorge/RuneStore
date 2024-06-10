## RuneStore

RuneStore is inspired by Cyfrin Updraft's [HorseStore](https://github.com/Cyfrin/1-horse-store-s23). RuneStore is meant to expand on the knowledge learned from HorseStore. RuneStore is also based on the magic runes shops usable in RuneScape and more specifically is web3 implementation of Aubury's Rune Shop found in Varrock.

### What differentiates this from HorseStore?

There are a few ways in which RuneStore differentiates and builds on top of the knowledge learned from HorseStore:

1. The magic runes will be represented by an ERC1155 contract provided by HuffMate
2. We are using an enum called MagicRunes that is used throughout the contract in events and function parameters so we'll see how that is handled in huff.
3. We will be emitting events.
4. Strings will be used for descriptions of runes.
5. There are more than six functions so we will implement binary search dispatching.
6. We are using OpenZeppelin's Ownable contract for access control.
7. 

If it's not too complex it would be interesting to implement the price mechanism that RuneScape shops use to dynamically increase and decrease the prices of runes.

### Store Inventory

RuneStore will sell different magic runes and a future version will add packs of runes.

#### Individual Runes

1. Fire
2. Water
3. Air
4. Earth
5. Mind
6. Body
7. Chaos
8. Death

### Future Work

#### Rune Packs

As a way of decreasing the amount of interactions to get more frequently used runes, later iterations of this contracts will support the ability to purchase rune packs which can be redeemed for 100 of their respective rune type.

These are the following rune types that would have rune packs available for purchase:

1. Fire
2. Water
3. Air
4. Earth
5. Mind
6. Chaos

#### Rune Price Fluctations

When users buy and sell runes there the prices of items increase and decreased based on store amounts. At first glance, this pricing mechanism appears to behave similarly to automated market makers where some invariant holds. Further investigation will make it possible to replicate the rune price fluctuations.

From  [Old School RuneScape Fandom](https://oldschoolrunescape.fandom.com/wiki/Prices)

```
The store price is listed in every item's infobox. This price will be at its highest when the store has precisely one item of this kind in stock. The price might drop if the quantity in stock is higher: whether it drops, how quickly it drops, and how many items must be in stock before it drops will depend on the item. Moreover, the store price might well be lower than the street price if the latter is affected by scarcity. It is worth noting that the store price is set within the game itself, and only crudely simulates supply and demand, whereas the street price is set by humans buying and selling (and, indirectly, by bartering) and can fluctuate erratically.
```