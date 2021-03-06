%% Load Data

% Set Default Figure Properties
set(0, 'DefaultLineLineWidth', 1);
addpath("./plots");

% Set Save Figure Parameter
% 0 = don't save, 1 = save
SAVE = 0;

patient = "P01";

% EDA File Names
left_eda_filename = sprintf("%s/E4_L/EDA.csv", patient);
right_eda_filename = sprintf("%s/E4_R/EDA.csv", patient);
left_eda_start_filename = sprintf("%s/E4_L/t_start.txt", patient);
right_eda_start_filename = sprintf("%s/E4_R/t_start.txt", patient);

% Load EDA Data
[ global_start_time, left_eda, right_eda, left_eda_dt, right_eda_dt ] = extract_eda_data(...
    left_eda_filename,right_eda_filename, ...
    left_eda_start_filename,right_eda_start_filename);

% Extract Trial Time Stamps
[enc_times, dis_times, rec_times] = extractTrials('P01Trials.mat');

%% Extract General Stats Data

trials = length(enc_times);

% Set the start time for the experiment
trial_start = timetoindex(char(enc_times(1)), global_start_time, left_eda_dt);
trial_end = timetoindex(char(rec_times(trials)), global_start_time, left_eda_dt);

% Set the global mean
global_mean_l = mean(nonzeros(left_eda));
global_mean_r = mean(nonzeros(right_eda));

% Set the trial mean
trials_mean_l = mean(nonzeros(left_eda(trial_start:trial_end)));
trials_mean_r = mean(nonzeros(right_eda(trial_start:trial_end)));

%% Memorize - Boxplots

period = "Memorize";
times = enc_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotOverlappingBoxplots(times, left_eda, right_eda, global_start_time, dt)
default_format(gca, name, "Trial Number","Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left Trial Mean","Left Global Mean","Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE);

%% Math - Boxplots

period = "Math";
times = dis_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotOverlappingBoxplots(times, left_eda, right_eda, global_start_time, dt)
default_format(gca, name, "Trial Number","Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left Trial Mean","Left Global Mean","Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE);

%% Recall - Boxplots

period = "Recall";
times = rec_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotOverlappingBoxplots(times, left_eda, right_eda, global_start_time, dt)
default_format(gca, name, "Trial Number","Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left Trial Mean","Left Global Mean","Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE);

%% Memorize Mean w/ Range

period = "Memorize";
times = enc_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotMeanWithRange(times, left_eda, right_eda, global_start_time, dt);
default_format(gca, sprintf("%s: EDA Mean w/ Range", name), "Trial Number", "Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left EDA", "Right EDA", "Left Trial Mean", "Left Global Mean", "Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE)

%% Math Mean w/ Range

period = "Math";
times = dis_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotMeanWithRange(times, left_eda, right_eda, global_start_time, dt);
default_format(gca, sprintf("%s: EDA Mean w/ Range", name), "Trial Number", "Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left EDA", "Right EDA", "Left Trial Mean", "Left Global Mean", "Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE);

%% Recall Mean w/ Range

period = "Recall";
times = rec_times;
dt = left_eda_dt;

% New Figure
f = figure;
name = sprintf("%s %s: EDA Boxplots", patient, period);
figfilename = sprintf("plots/%s.jpg", name);

% Plot Trials
plotMeanWithRange(times, left_eda, right_eda, global_start_time, dt);
default_format(gca, sprintf("%s: EDA Mean w/ Range", name), "Trial Number", "Conductance \muS");
ylim([13 27]);

% Set Mean Lines
yline(trials_mean_l, "--b", "LineWidth", 1);
yline(global_mean_l, ":b", "LineWidth", 1);
yline(trials_mean_r, "--r", "LineWidth", 1);
yline(global_mean_r, ":r", "LineWidth", 1);

% Set Legend
legend("Left EDA", "Right EDA", "Left Trial Mean", "Left Global Mean", "Right Trial Mean", "Right Global Mean");
legend("location","best");

% Save Figure
scaleFigure(f, 2, 1);
saveFig(f, figfilename, SAVE);
