% Kohl C, Parviainen, T & Jones, SR: Neural Mechanisms Underlying 
% Human Auditory Evoked Responses Revealed by Human Neocortical Neurosolver

%% Plot Model & Data
% Plot alternative models associated with left contralateral AEFs  
% (Manuscript Figure 4)
% Alternative 1: change in calcium channel density
% Alternative 2: change in connections targeting inhibitory interneurons

% Written by Carmen Kohl, 2020.
% github.com/kohl-carmen/MIP-TMS

clear
dir = fileparts(which('plot_fig4.m'));
cd(dir)

Alt_Model={'Alternative_Gains','Alternative_Ca'};
colours = {[109 187 228], [41 47 123]; [224 80 45], [37 79 39]};
%% Figure 4
figure
hold on
ylims = [-60 30];
xlims = [0 250];
sim_trials = 10;
subidx = [1 3; 6 8];
for alt = 1:length(Alt_Model)
    % plot trials
    for trial = 1:sim_trials
        trial_sim = load(strcat('HNN_Simulations\',Alt_Model{alt},...
                                '\dpl_',num2str(trial-1),'.txt'));
        sim_time = trial_sim(:,1);
        trial_sim_L5 = trial_sim(:,4);
        trial_sim_L2 = trial_sim(:,3);
        trial_sim = trial_sim(:,2);
        subplot(1,4,subidx(1,alt))
        hold on
        plot(sim_time, trial_sim, 'Color', [108 108 108 127]./255)
        subplot(2,4,subidx(2,alt))
        hold on
        plot(sim_time, trial_sim_L5, 'Color', [colours{2,1}, 127]./255)
        plot(sim_time, trial_sim_L2, 'Color', [colours{2,2}, 127]./255)
    end
    % plot average
    
    % load MEG data (left contralateral)
    data = load(strcat('MEG_Data\L_Contra.txt'));
    data_time = data(:,1);
    data = data(:,2);
        
    % load alternative model
    model = load(strcat('HNN_Simulations\',Alt_Model{alt},'\dpl.txt'));
    model_time = model(:,1);
    model_L5 = model(:,4);
    model_L2 = model(:,3);
    model = model(:,2);

    %plot data
    subplot(1,4,subidx(1,alt))
    l1(1) = plot(data_time, data ,'Color',...
                 colours{1,1}./255,'Linewidth',2);
    l1(2) = plot(model_time, model,'--','Color',...
                 colours{1,2}./255,'Linewidth',2);
    xlabel('Time (ms)')
    ylabel('Amplitude (nAm)')
    ylim(ylims)
    xlim(xlims)
    title(strcat(Alt_Model{alt}(1:11),': ', Alt_Model{alt}(13:end)))
    legend(l1, 'Data','Model')
    subplot(2,4,subidx(2,alt))
    l2(1) = plot(model_time, model_L5, 'Color',...
                 colours{2,1}./255,'Linewidth',2);
    l2(2) = plot(model_time, model_L2, 'Color',...
                 colours{2,2}./255,'Linewidth',2);
    xlabel('Time (ms)')
    ylabel('Amplitude (nAm)')
    ylim(ylims)
    xlim(xlims)
    title('Layer II/III - Layer V')
    legend(l2, 'Layer V','Layer II/III')

end



