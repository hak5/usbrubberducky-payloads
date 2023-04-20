if (LAN) {
    Promise.all(
        [
            recon('http', 80),
            recon('https', 443)
        ]
    );
}