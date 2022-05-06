// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

contract MintNFTs is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We split the SVG at the part where it asks for the background color.
  string svgPartOne = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='";
  string svgPartTwo = "'/><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    string[] firstWords = [
        "ragged",
        "dull",
        "resolute",
        "stiff",
        "intelligent",
        "temporary",
        "chemical",
        "stale",
        "organic",
        "typical",
        "puzzled",
        "valuable",
        "fancy",
        "wrathful",
        "plucky",
        "illustrious",
        "illustrious"
    ];
    string[] secondWords = [
        "defeated",
        "defiant",
        "delicious",
        "delightful",
        "depressed",
        "determined",
        "eager",
        "early",
        "elated",
        "embarrassed",
        "empty",
        "encouraging",
        "energetic"
        "enthusiastic"
        "envious",
        "evil",
        "excited",
        "exuberant",
        "faint",
        "fair",
        "faithful",
        "fantastic",
        "fast",
        "fat",
        "few"
        "vast",
        "victorious",
        "vivacious",
        "voiceless",
        "wasteful",
        "watery",
        "weak",
        "weary",
        "wet",
        "frantic",
        "precious",
        "pretty",
        "prickly",
        "proud",
        "puny",
        "purple",
        "purring"
    ];
    string[] thirdWords = [
        "oatmeal",
        "shelf",
        "stamp",
        "loaf",
        "train",
        "tin",
        "waves"
        "vest",
        "girl",
        "bait",
        "ball",
        "rate",
        "badge",
        "yard",
        "house",
        "zoo",
        "river",
        "magic",
        "cellar",
        "partner",
        "lake",
        "children",
        "alarm",
        "milk",
        "dress",
        "pollution",
        "chalk",
        "zipper"
    ];

// Get fancy with it! Declare a bunch of colors.
  string[] colors = ['#FF6633', '#FFB399', '#FF33FF', '#FFFF99', '#00B3E6', 
		  '#E6B333', '#3366E6', '#999966', '#99FF99', '#B34D4D',
		  '#80B300', '#809900', '#E6B3B3', '#6680B3', '#66991A', 
		  '#FF99E6', '#CCFF1A', '#FF1A66', '#E6331A', '#33FFCC',
		  '#66994D', '#B366CC', '#4D8000', '#B33300', '#CC80CC', 
		  '#66664D', '#991AFF', '#E666FF', '#4DB3FF', '#1AB399',
		  '#E666B3', '#33991A', '#CC9999', '#B3B31A', '#00E680', 
		  '#4D8066', '#809980', '#E6FF80', '#1AFF33', '#999933',
		  '#FF3380', '#CCCC00', '#66E64D', '#4D80CC', '#9900B3', 
		  '#E64D66', '#4DB380', '#FF4D4D', '#99E6E6', '#6666FF'];

  event NewEpicNFTMinted(address sender, uint256 tokenId);

  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is the MintNFTs contract");
  }

  function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(Strings.toString(block.timestamp), Strings.toString(tokenId))));
    rand = rand % firstWords.length;
    return firstWords[rand];
  }

  function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(Strings.toString(block.timestamp), Strings.toString(tokenId))));
    rand = rand % secondWords.length;
    return secondWords[rand];
  }

  function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(Strings.toString(block.timestamp), Strings.toString(tokenId))));
    rand = rand % thirdWords.length;
    return thirdWords[rand];
  }

  // Same old stuff, pick a random color.
  function pickRandomColor(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(Strings.toString(block.timestamp), Strings.toString(tokenId))));
    rand = rand % colors.length;
    return colors[rand];
  }

  function random(string memory input) internal pure returns (uint256) {
    return uint256(keccak256(abi.encodePacked(input)));
  }

  // function random2() private view returns (uint256) {
  //   return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp)));
  // }

  function mintNFT() public {
    uint256 newItemId = _tokenIds.current();

    string memory first = pickRandomFirstWord(newItemId);
    string memory second = pickRandomSecondWord(newItemId);
    string memory third = pickRandomThirdWord(newItemId);
    string memory combinedWord = string(abi.encodePacked(first," ", second, " ", third));

    // Add the random color in.
    string memory randomColor = pickRandomColor(newItemId);
    string memory finalSvg = string(abi.encodePacked(svgPartOne, randomColor, svgPartTwo, combinedWord, "</text></svg>"));

    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    combinedWord,
                    '", "description": "A highly acclaimed collection of squares.", "image": "data:image/svg+xml;base64,',
                    Base64.encode(bytes(finalSvg)),
                    '"}'
                )
            )
        )
    );

    string memory finalTokenUri = string(
        abi.encodePacked("data:application/json;base64,", json)
    );

    console.log("\n--------------------");
    console.log(finalTokenUri);
    console.log("--------------------\n");

    _safeMint(msg.sender, newItemId);
  
    _setTokenURI(newItemId, finalTokenUri);
  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    emit NewEpicNFTMinted(msg.sender, newItemId);
  }
}