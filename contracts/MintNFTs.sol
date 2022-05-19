// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";
import "./datetime.sol";
import "./svg.sol";
import "./svgColors.sol";

import {Base64} from "./libraries/Base64.sol";

contract MintNFTs is ERC721URIStorage, DateTime, Svg, SvgColors {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // uint256 newItemId = _tokenIds.current();

    _DateTime timeObject = parseTimestamp(block.timestamp);

    string currentHour = Strings.toString(timeObject.hour);
    string currentMinute = Strings.toString(timeObject.minute);
    string currentSecond = Strings.toString(timeObject.second);
    string currentDay = Strings.toString(timeObject.day);
    string currentMonth = Strings.toString(timeObject.month);
    string currentYear = Strings.toString(timeObject.year);

    string currentTime =
        string(
            abi.encodePacked(
                currentHour,
                ":",
                currentMinute,
                ":",
                currentSecond
            )
        );
    string currentDate =
        string(
            abi.encodePacked(currentMonth, "/", currentDay, "/", currentYear)
        );

    event NewEpicNFTMinted(address sender, uint256 tokenId);

    constructor() ERC721("McFarland Springs Trout NFT", "TROUT") {
        console.log("This is the MintNFTs contract");
    }

    function pickRandomBackgroundColor() public view returns (uint256) {
        uint256 randColor = random(
            string(
                abi.encodePacked(
                    Strings.toString(block.timestamp)
                    // Strings.toString(tokenId)
                )
            )
        );
        randColor = randColor % backgroundColorArr.length;
        return randColor;
    }

    function pickRandomColorPalette() public view returns (uint256) {
        uint256 randPalette = random(
            string(abi.encodePacked(Strings.toString(block.timestamp)))
        );
        randPalette = randPalette % allColors.length;
        return randPalette;
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function generateSVG() internal view returns (string memory) {
        // uint256 newItemId = _tokenIds.current();
        uint256 colorPalette = pickRandomColorPalette();
        uint256 backgroundColor = pickRandomBackgroundColor();

        string memory finalSVG = string(
            abi.encodePacked(
                svg1,
                backgroundColorArr[backgroundColor],
                svg2,
                allColors[colorPalette][0],
                svg3,
                allColors[colorPalette][1],
                svg4,
                allColors[colorPalette][2],
                svg5,
                allColors[colorPalette][3],
                svg6,
                "black",
                svg7
            )
        );
        return finalSVG;
    }

    function mintNFT() public {
        uint256 newItemId = _tokenIds.current();
        string memory finalSvg = generateSVG();

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        "trout test title goes here",
                        '", "description": "A highly acclaimed collection of trout stuff- description goes here.", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(finalSvg)),
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        // console.log("\n--------------------");
        // console.log("finalTokenUri");
        // console.log("--------------------\n");
        console.log("svg= ", finalSvg);
        // console.log("_____________________\n");
        // console.log("timestamp: ", block.timestamp);
        // console.log("created at: ", currentTime);
        // console.log("on: ", currentDate);


        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, finalTokenUri);

        _tokenIds.increment();
        // console.log(
        //     "An NFT w/ ID %s has been minted to %s",
        //     newItemId,
        //     msg.sender
        // );
        emit NewEpicNFTMinted(msg.sender, newItemId);
    }
}
