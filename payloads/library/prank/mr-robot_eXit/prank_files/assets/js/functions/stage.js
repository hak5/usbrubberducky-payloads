function stage(level, iterator) {
    let stage;
    stage = LEVELS[level][iterator];
    if (stage.banner && stage.issue && stage.response) {
        BANNER.style.backgroundImage = `url("${stage.banner}")`;
        ISSUE.innerHTML = stage.issue;
        let response;
        response = stage.response;
        PROMPT.placeholder = (HINT === 'TRUE') ? response : `${response.charAt(0)}...`;
        PROMPT.value = null;
        return response;
    } else {
        off();
    }
}