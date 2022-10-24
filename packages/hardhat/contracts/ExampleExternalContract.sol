// SPDX-License-Identifier: MIT
pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading

import "@openzeppelin/contracts/access/Ownable.sol";

contract ExampleExternalContract is Ownable {
    bool public completed;

    function complete() public payable {
        completed = true;
    }

    function retrieveEther(address to) public {
        completed = false;
        (bool sent, bytes memory data) = to.call{value: address(this).balance}(
            ""
        );
        require(sent, "RIP; retrieval failed :( ");
    }
}
