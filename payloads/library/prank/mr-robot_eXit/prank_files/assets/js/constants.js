const SCREEN = document.querySelector('#screen');

const BANNER = document.querySelector('#banner');

const ISSUE = document.querySelector('#issue');

const HINT = (new URLSearchParams(document.location.search).get('hint'));

const PROMPT = document.querySelector('#prompt');

const LEVELS = [
    [
        {
            "banner": "./assets/images/barrel.png",
            "issue": "You're trapped in a dungeon with your friend. <br /> You see a barrel. What do you do ?",
            "response": "Move the barrel"
        },
        {
            "banner": "./assets/images/tunnel.png",
            "issue": "The barrel rolls aside and you find a secret tunnel. <br /> What do you do ?",
            "response": "Enter tunnel"
        },
        {
            "banner": "./assets/images/friend.png",
            "issue": "You start to escape but your friend is too weak to <br /> go with you. They hand you a note. What do you do ?",
            "response": "Read note"
        },
        {
            "banner": "./assets/images/note.png",
            "issue": "It is too dark to read the note. <br /> What do you do ?",
            "response": "Leave"
        },
        {
            "banner": "./assets/images/crawl.png",
            "issue": "You crawl through the tunnel and the tunnel leads <br /> you to a beach. What do you do ?",
            "response": "Look"
        },
        {
            "banner": "./assets/images/boat.png",
            "issue": "In the water you see a boat. <br /> What do you do ?",
            "response": "Get on the boat"
        },
        {
            "banner": "./assets/images/world.png",
            "issue": "Congratulations, you're heading to a new world ! <br /> Do you want to play again ?",
            "response": "Yes"
        }
    ],
    [
        {
            "banner": "./assets/images/barrel.png",
            "issue": "You're trapped in a dungeon with your friend. <br /> You see a barrel. What do you do ?",
            "response": "Sit down next to my friend"
        },
        {
            "banner": "./assets/images/note.png",
            "issue": "Your friend hands you a note. <br /> What do you do ?",
            "response": "Light a match"
        },
        {
            "banner": "./assets/images/message.png",
            "issue": "The note says, \"Don't leave me here\". <br /> Do you leave your friend or stay ?",
            "response": "Stay"
        },
        {
            "banner": false,
            "issue": false,
            "response": false
        }
    ]
];

const OFF = document.querySelector('#off');