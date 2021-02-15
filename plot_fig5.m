% Kohl C, Parviainen, T & Jones, SR: Neural Mechanisms Underlying 
% Human Auditory Evoked Responses Revealed by Human Neocortical Neurosolver

%% Plot Model & Data
% Plot simulated and empirical data for left/right hemispheres as well as 
% contralateral/ispilateral tone presentations (Manuscript Figure 5)

% Written by Carmen Kohl, 2020.
% github.com/kohl-carmen/MIP-TMS

clear
dir = fileparts(which('plot_fig5.m'));
cd(dir)
Hemi = {'L', 'R',}; %left/right hemisphere
Tone = {'Contra','Ipsi'}; %contra/ipsilateral tone presentation

%% Figure 5
figure
ylims = [-60 20];
xlims = [0 250];
colours = {[109 187 228 127], [226 113 113 127]; [41 47 123], [126 20 22]};
for hemi=1:length(Hemi)
    subplot(1,length(Hemi),hemi)
    hold on
    title(strcat('Hemi: ',Hemi{hemi}))
    xlabel('Time (ms)')
    ylabel('Amplitude (nAm)')
    xlim(xlims)
    ylim(ylims)
    for tone = 1:length(Tone)
        % load MEG data
        data = load(strcat('MEG_Data\',Hemi{hemi},'_',Tone{tone},'.txt'));
        data_time = data(:,1);
        data = data(:,2);
        % load simulation
        model = load(strcat('HNN_Simulations\',Hemi{hemi},'_',...
                             Tone{tone},'\dpl.txt'));
        model_time = model(:,1);
        model = model(:,2);
        %plot
        plot(data_time, data,'Color', colours{1,tone}./255,'Linewidth',4);
        plot(model_time, model, 'Color', colours{2,tone}./255, 'Linewidth', 2)
    end

end
legend('contra data','contra model','ipsi data', 'ipsi model')        
                  