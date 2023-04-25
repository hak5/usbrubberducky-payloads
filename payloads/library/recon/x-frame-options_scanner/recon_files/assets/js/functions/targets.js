function targets() {
    let bounds, wholes, hosts;
    bounds = LAN.split('-');
    wholes = [bounds[0].split('.'), bounds[1].split('.')];
    hosts = [parseInt(wholes[0].pop()), parseInt(wholes[1].pop())];
    wholes = [wholes[0].join('.'), wholes[1].join('.')];
    if (wholes[0] === wholes[1]) {
        let whole, targets;
        whole = wholes[0];
        targets = new Array();
        for (let host = hosts[0]; host <= hosts[1]; host++) {
            targets.push(whole + '.' + host);
        }
        return(targets);
    } else {
        return(new Array());
    }
}