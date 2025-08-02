// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@thirdweb-dev/contracts/token/erc20/ERC20Upgradeable.sol";
import "@thirdweb-dev/contracts/extension/PermissionsEnumerable.sol";
import "@thirdweb-dev/contracts/extension/ContractMetadata.sol";
import "@thirdweb-dev/contracts/extension/Gasless.sol";

contract CoinOfInterCommerce is
    ERC20Upgradeable,
    PermissionsEnumerable,
    ContractMetadata,
    Gasless
{
    function initialize(address _lpAddress) public initializer {
        __ERC20_init("Coin Of Inter-Commerce", "COI");
        _setupOwner(_lpAddress);
        _mint(_lpAddress, 27000000 * 10 ** decimals());
    }

    function _canSetContractURI() internal view override returns (bool) {
        return msg.sender == owner();
    }
}
