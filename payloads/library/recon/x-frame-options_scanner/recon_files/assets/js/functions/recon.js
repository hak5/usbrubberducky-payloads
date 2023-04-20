async function recon(scheme, port) {
    for (let target of targets()) {
        let url, div, iframe;
        url = (scheme + '://' + target + ':' + port + '/');
        div = document.createElement('div');
        div.id = 'url';
        div.innerText = url;
        iframe = document.createElement('iframe');
        iframe.sandbox = 'allow-same-origin allow-scripts';
        iframe.src = url;
        OUTPUT.appendChild(div);
        OUTPUT.appendChild(iframe);
        await sleep();
    }
}