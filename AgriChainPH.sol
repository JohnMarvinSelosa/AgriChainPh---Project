// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriChainPH {

    struct Product {

        string name;
        string origin;
        uint256 quantity;
        address owner;

    }

    mapping(uint256 => Product) public products;

    uint256 public productCount;


    function registerProduct(

        string memory _name,
        string memory _origin,
        uint256 _quantity

    ) public {

        products[productCount] = Product(

            _name,
            _origin,
            _quantity,
            msg.sender

        );

        productCount++;

    }


    function getProduct(

        uint256 _id

    )

    public

    view

    returns(

        string memory,
        string memory,
        uint256,
        address

    )

    {

        Product memory p = products[_id];

        return (

            p.name,
            p.origin,
            p.quantity,
            p.owner

        );
    }


    function transferOwnership(

        uint256 _id,
        address _newOwner

    ) public {

        require(

            products[_id].owner == msg.sender,

            "Not Owner"

        );

        products[_id].owner = _newOwner;

    }
}