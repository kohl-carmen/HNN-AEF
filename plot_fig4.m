% Kohl C, Parviainen, T & Jones, SR: Neural Mechanisms Underlying 
% Human Auditory Evoked Responses Revealed by Human Neocortical Neurosolver

%% Plot Model & Data
% Plot models and data associated contralateral AEFs (left/right)
% (Manuscript Figure 4 b & e)

% Written by Carmen Kohl, 2020.
% github.com/kohl-carmen/MIP-TMS

clear
dir = fileparts(which('plot_fig3.m'));
cd(dir)

% Conditions
Hemi = {'L', 'R',}; %left/right hemisphere
Tone = {'Contra'}; %contra/ipsilateral tone presentation

% Figure Settings
colours = {[109 187 228], [41 47 123]; [224 80 45], [37 79 39]};
ylims = [-60 30];
xlims = [0 250];
sim_trials = 10;
subidx = [1 3; 6 8];

% Figure
figure
for hemi = 1:length(Hemi)
    %% plot individual trials
    for trial = 1:sim_trials
        
        % load simulation
        trial_simulation = load(strcat('HNN_Simulations\',Hemi{hemi},'_',...
                                Tone{:},'\dpl_',num2str(trial-1),'.txt'));
        simulation_time = trial_simulation(:,1); %time
        trial_simulation_agg = trial_simulation(:,2);%aggregate dipole
        trial_simulation_L2 = trial_simulation(:,3); %layerII/III dipole
        trial_simulation_L5 = trial_simulation(:,4);%layerV dipole
        
        % plot aggregate dipoles
        subplot(1,4,subidx(1,hemi))
        hold on
        plot(simulation_time, trial_simulation_agg,...
             'Color', [colours{1,2}, 127]./255)
         
        % plot layer-specific dipoles
        subplot(2,4,subidx(2,hemi))
        hold on
        plot(simulation_time, trial_simulation_L5,...
             'Color', [colours{2,1}, 127]./255)
        plot(simulation_time, trial_simulation_L2,...
             'Color', [colours{2,2}, 127]./255)
    end
    %% plot average    
    % load MEG data 
    data = load(strcat('MEG_Data\',Hemi{hemi},'_Contra.txt'));
    data_time = data(:,1); %time
    data = data(:,2); %AEF
        
    % load simulation
    simulation = load(strcat('HNN_Simulations\',Hemi{hemi},...
                             '_Contra\dpl.txt'));
    simulation_time = simulation(:,1);%time
    simulation_agg = simulation(:,2);%aggregate dipole
    simulation_L2 = simulation(:,3);%layerII/III dipole
    simulation_L5 = simulation(:,4);%layerV dipole
    
    %plot data and aggregate dipoles
    subplot(1,4,subidx(1,hemi))
    l1(1) = plot(data_time, data ,'Color',...
                 colours{1,1}./255,'Linewidth',3);
    l1(2) = plot(simulation_time, simulation_agg,'Color',...
                 colours{1,2}./255,'Linewidth',3);
    xlabel('Time (ms)')
    ylabel('Amplitude (nAm)')
    ylim(ylims)
    xlim(xlims)
    title(strcat('Hemisphere: ',Hemi{hemi},'- Contralateral'))
    legend(l1, 'Data','Model')
    
    % plot layer-specific dipoles
    subplot(2,4,subidx(2,hemi))
    l2(1) = plot(simulation_time, simulation_L5, 'Color',...
                 colours{2,1}./255,'Linewidth',2);
    l2(2) = plot(simulation_time, simulation_L2, 'Color',...
                 colours{2,2}./255,'Linewidth',2);
    xlabel('Time (ms)')
    ylabel('Amplitude (nAm)')
    ylim(ylims)
    xlim(xlims)
    title('Layer-specific Dipoles')
    legend(l2, 'Layer V','Layer II/III')
end



