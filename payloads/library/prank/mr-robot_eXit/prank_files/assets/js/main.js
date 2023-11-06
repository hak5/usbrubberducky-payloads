PROMPT.onkeypress = function (event) {
    if (
        (event.key === 'Enter') &&
        (level < LEVELS.length) &&
        (PROMPT.value === response)
    ) {
        iterator++;
        if (iterator === LEVELS[level].length) {
            level++;
            iterator = 0;
            response = stage(level, iterator);
            ISSUE.style.animationDuration = '1s';
        } else {
            response = stage(level, iterator);
        }
    }
};