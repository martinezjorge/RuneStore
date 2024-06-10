// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IERC1155} from "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";

/// @title IRuneStore
/// @author Jorge A Martinez
/// @notice A store where you can buy and sell NFTs representing magic runes.
interface IRuneStore is IERC1155 {

    /*//////////////////////////////////////////////////////////////////////////
                                       TYPES
    //////////////////////////////////////////////////////////////////////////*/

    /// @notice The enumerated set of magic runes the shop sells.
    /// @dev This enumeration can be expected to be consistent between documentation and code.
    enum MagicRunes {
        FIRE,
        WATER,
        AIR,
        EARTH,
        MIND,
        BODY,
        CHAOS,
        DEATH
    }

    /*//////////////////////////////////////////////////////////////////////////
                                       EVENTS
    //////////////////////////////////////////////////////////////////////////*/

    /// @notice Emitted when a user buys runes from the store.
    /// @param rune The index representing the type of rune being bought.
    /// @param amount The amount of runes bought.
    /// @param priceBoughtFor The price the runes were bought for.
    event RunesBought(
        MagicRunes indexed rune, 
        uint256 indexed amount, 
        uint256 indexed priceBoughtFor
    );

    /// @notice Emitted when a user sells runes to the store.
    /// @param rune The index representing the type of rune being bought.
    /// @param amount The amount of runes bought.
    /// @param priceSoldFor The price the runes were sold for.
    event RunesSold(
        MagicRunes indexed rune, 
        uint256 indexed amount, 
        uint256 indexed priceSoldFor
    );

    /// @notice Emitted when the price of a rune is updated.
    /// @param rune The index representing the type of rune being bought.
    /// @param newPrice The new price of the magic rune.
    event PriceUpdated(
        MagicRunes indexed rune, 
        uint256 indexed newPrice
    );

    /// @notice Emitted when the description of a rune is updated.
    /// @param rune The index representing the type of rune being bought.
    /// @param newDescription The new price of the magic rune.
    event DescriptionUpdated(
        MagicRunes indexed rune,
        string indexed newDescription
    );

    /*//////////////////////////////////////////////////////////////////////////
                                ADMIN FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @notice Allows store owner to set the price of rune.
    /// @param rune The enum of the rune's price that's being set.
    /// @param price The new price of the magic rune.
    function setPrice(MagicRunes rune, uint256 price) external;

    /// @notice Allows store owner to set the description of a rune.
    /// @param rune The enum of the rune's description that's being set.
    /// @param newDescription The new description of the magic rune.
    function setDescription(MagicRunes rune, string calldata newDescription) external;

    /*//////////////////////////////////////////////////////////////////////////
                                 CONSTANT FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @notice Retrieves the market value of a magic rune.
    /// @dev This value will fluctuate based on supply.
    /// @param rune The type of rune as a string.
    function priceOf(MagicRunes rune) external returns(uint256 price);

    /// @notice Retrieves the description of the rune.
    /// @dev Retrieves hardcoded descriptions.
    /// @param rune The type of rune as a string.
    function examine(MagicRunes rune) external returns(string memory description);

    /*//////////////////////////////////////////////////////////////////////////
                               NON-CONSTANT FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @notice Buys one of the specified rune.
    /// @dev This mints one rune to the caller.
    /// @param rune The type of rune as a string.
    function buyOneRune(MagicRunes rune) payable external;

    /// @notice Buys five of the specified runes.
    /// @dev This mints five runes to the caller.
    /// @param rune The type of rune as a string.
    function buyFiveRunes(MagicRunes rune) payable external;

    /// @notice Buys ten of the specified runes.
    /// @dev This mints ten runes to the caller.
    /// @param rune The type of rune as a string.
    function buyTenRunes(MagicRunes rune) payable external;
    
    /// @notice Buys fifty of the specified runes.
    /// @dev This mints fifty runes to the caller.
    /// @param rune The type of rune as a string.
    function buyFiftyRunes(MagicRunes rune) payable external;

    /// @notice Sells one of the specified rune.
    /// @dev This burns one rune from the caller.
    /// @param rune The type of rune as a string.
    function sellOneRune(MagicRunes rune) external;

    /// @notice Sells five of the specified runes.
    /// @dev This burns five runes from the caller.
    /// @param rune The type of rune as a string.
    function sellFiveRunes(MagicRunes rune) external;

    /// @notice Sells ten of the specified runes.
    /// @dev This burns ten runes from the caller.
    /// @param rune The type of rune as a string.
    function sellTenRunes(MagicRunes rune) external;

    /// @notice Sells fifty of the specified runes.
    /// @dev This burns fifty runes from the caller.
    /// @param rune The type of rune as a string.
    function sellFiftyRunes(MagicRunes rune) external;
}