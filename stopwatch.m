function stopwatch
    % Create the main figure window
    fig = figure('Name', 'Digital Stopwatch', 'NumberTitle', 'off', ...
                 'Position', [500, 300, 300, 200], 'Resize', 'off');

    % Create a text display for time
    timeDisplay = uicontrol('Style', 'text', 'FontSize', 20, ...
                            'Position', [50, 100, 200, 50], ...
                            'String', '00:00:00');

    % Start Button
    startButton = uicontrol('Style', 'pushbutton', 'String', 'Start', ...
                            'Position', [30, 30, 70, 40], 'FontSize', 12, ...
                            'Callback', @startTimer);

    % Stop Button
    stopButton = uicontrol('Style', 'pushbutton', 'String', 'Stop', ...
                           'Position', [115, 30, 70, 40], 'FontSize', 12, ...
                           'Callback', @stopTimer);

    % Reset Button
    resetButton = uicontrol('Style', 'pushbutton', 'String', 'Reset', ...
                            'Position', [200, 30, 70, 40], 'FontSize', 12, ...
                            'Callback', @resetTimer);

    % Initialize timer object
    t = timer('ExecutionMode', 'fixedRate', 'Period', 1, ...
              'TimerFcn', @updateTime);

    % Initialize stopwatch variables
    elapsedTime = 0;
    isRunning = false;

    % Function to start the timer
    function startTimer(~, ~)
        if ~isRunning
            start(t);
            isRunning = true;
        end
    end

    % Function to stop the timer
    function stopTimer(~, ~)
        if isRunning
            stop(t);
            isRunning = false;
        end
    end

    % Function to reset the timer
    function resetTimer(~, ~)
        stop(t);
        elapsedTime = 0;
        isRunning = false;
        timeDisplay.String = '00:00:00';
    end

    % Function to update time
    function updateTime(~, ~)
        elapsedTime = elapsedTime + 1;
        hours = floor(elapsedTime / 3600);
        minutes = floor(mod(elapsedTime, 3600) / 60);
        seconds = mod(elapsedTime, 60);
        timeDisplay.String = sprintf('%02d:%02d:%02d', hours, minutes, seconds);
    end
end
