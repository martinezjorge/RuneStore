// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IRuneStore} from "./IRuneStore.sol";
import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @title RuneStore
/// @author Jorge A Martinez
/// @notice See the documentation in {IRuneStore}
contract RuneStore is IRuneStore, Ownable(msg.sender), ERC1155("rune.images") {

    /*//////////////////////////////////////////////////////////////////////////
                                    CONSTANTS
    //////////////////////////////////////////////////////////////////////////*/

    uint8 internal constant ONE = 1;
    uint8 internal constant FIVE = 5;
    uint8 internal constant TEN = 10;
    uint8 internal constant FIFTY = 50;

    /*//////////////////////////////////////////////////////////////////////////
                                    MAPPINGS
    //////////////////////////////////////////////////////////////////////////*/

    mapping(MagicRunes rune => uint256 price) internal prices;
    mapping(MagicRunes rune => string description) internal descriptions;

    /*//////////////////////////////////////////////////////////////////////////
                                ADMIN FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @inheritdoc IRuneStore
    function setPrice(MagicRunes rune, uint256 newPrice) onlyOwner external {
        prices[rune] = newPrice;
        emit PriceUpdated(rune, newPrice);
    }

    /// @inheritdoc IRuneStore
    function setDescription(MagicRunes rune, string calldata newDescription) onlyOwner external {
        descriptions[rune] = newDescription;
        emit DescriptionUpdated(rune, newDescription);
    }

    /*//////////////////////////////////////////////////////////////////////////
                                CONSTANT FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @inheritdoc IRuneStore
    function priceOf(MagicRunes rune) external view returns(uint256 price) {
        price = prices[rune];
    }

    /// @inheritdoc IRuneStore
    function examine(MagicRunes rune) external view returns(string memory description) {
        description = descriptions[rune];
    }

    /*//////////////////////////////////////////////////////////////////////////
                            NON-CONSTANT USER FUNCTIONS
    //////////////////////////////////////////////////////////////////////////*/

    /// @inheritdoc IRuneStore
    function buyOneRune(MagicRunes rune) payable external {
        require(msg.value == prices[rune], "Not enough gold!");
        _mint(msg.sender, uint8(rune), ONE, "");
        emit RunesBought(rune, ONE, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function buyFiveRunes(MagicRunes rune) payable external {
        require(msg.value == FIVE * prices[rune], "");
        _mint(msg.sender, uint8(rune), FIVE, "");
        emit RunesBought(rune, FIVE, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function buyTenRunes(MagicRunes rune) payable external {
        require(msg.value == TEN * prices[rune], "");
        _mint(msg.sender, uint8(rune), TEN, "");
        emit RunesBought(rune, TEN, prices[rune]);
    }
    
    /// @inheritdoc IRuneStore
    function buyFiftyRunes(MagicRunes rune) payable external {
        require(msg.value == FIFTY * prices[rune], "");
        _mint(msg.sender, uint8(rune), FIFTY, "");
        emit RunesBought(rune, FIFTY, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function sellOneRune(MagicRunes rune) external {
        require(balanceOf(msg.sender, uint8(rune)) >= ONE);
        _burn(msg.sender, uint8(rune), ONE);
        (bool sent, ) = (msg.sender).call{value: prices[rune]}("");
        require(sent, "Failed to send Ether");
        emit RunesSold(rune, ONE, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function sellFiveRunes(MagicRunes rune) external {
        require(balanceOf(msg.sender, uint8(rune)) >= FIVE);
        _burn(msg.sender, uint8(rune), FIVE);
        (bool sent, ) = (msg.sender).call{value: prices[rune]*FIVE}("");
        require(sent, "Failed to send Ether");
        emit RunesSold(rune, FIVE, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function sellTenRunes(MagicRunes rune) external {
        require(balanceOf(msg.sender, uint8(rune)) >= TEN);
        _burn(msg.sender, uint8(rune), TEN);
        (bool sent, ) = (msg.sender).call{value: prices[rune]*TEN}("");
        require(sent, "Failed to send Ether");
        emit RunesSold(rune, TEN, prices[rune]);
    }

    /// @inheritdoc IRuneStore
    function sellFiftyRunes(MagicRunes rune) external {
        require(balanceOf(msg.sender, uint8(rune)) >= FIFTY);
        _burn(msg.sender, uint8(rune), FIFTY);
        (bool sent, ) = (msg.sender).call{value: prices[rune]*FIFTY}("");
        require(sent, "Failed to send Ether");
        emit RunesSold(rune, FIFTY, prices[rune]);
    }
}