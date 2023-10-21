async function off() {
    SCREEN.style.display = 'none';
    OFF.style.display = 'block';
    for (let reducer = 100; reducer >= 0; reducer -= 10) {
        OFF.style.width = `${reducer}%`;
        await sleep(25);
    }
    OFF.style.display = 'none';
}