# Neural Mechanisms Underlying Human Auditory Evoked Responses Revealed by Human Neocortical Neurosolver

Kohl, C.<sup>1</sup>, Parviainen, T. <sup>2, 3</sup> & Jones, S. R. <sup>1, 4</sup>  
   
<sup><sup>1</sup> Department of Neuroscience, Carney Institute for Brain Sciences, Brown University, Providence, United States  
<sup>2</sup> Centre for Interdisciplinary Brain Research, Department of Psychology, University of Jyväskylä, P.O. Box 35, FI- 40014, Jyväskylä, Finland  
<sup>3</sup> Meg Core Aalto Neuroimaging, Aalto University, P.O. Box 15100, FI-00076, AALTO, Espoo, Finland  
<sup>4</sup> Center for Neurorestoration and Neurotechnology, Providence VAMC, Providence, United States</sup>  

***
This repository contains data as well as code to replicate the main findings associated with the manuscript “Neural Mechanisms Underlying Human Auditory Evoked Responses Revealed by Human Neocortical Neurosolver”. 

Abstract:
*Auditory evoked fields (AEFs) are commonly studied, yet their underlying neural mechanisms remain poorly understood. Here, we used the biophysical modelling software Human Neocortical Neurosolver (HNN) whose foundation is a canonical neocortical circuit model to interpret the cell and network mechanisms contributing to macroscale AEFs elicited by a simple tone, measured with magnetoencephalography. We found that AEFs can be reproduced by activating the neocortical circuit through a layer specific sequence of feedforward and feedback excitatory drives, similar to prior simulation of somatosensory evoked responses, supporting the notion that basic structures and activation patterns are preserved across sensory regions. We also applied the modeling framework to develop and test prediction on neural mechanisms underlying AEF differences in the left and right hemispheres, as well as between hemispheres contralateral and ipsilateral to the presentation of the auditory stimulus. We found that varying the strength of the activating cortical feedback inputs simulates the commonly observed right hemisphere dominance, while varying the input latency and the number of cells contributing to the signal accounted for the contralateral dominance. These results provide a direct link between human data and prior animal studies and lay the foundation for future translational research examining the mechanisms underlying alteration in this fundamental biomarker of auditory processing in healthy cognition and neuropathology.*  

***
## Code
This repository contains three .m files which reproduce the main result figures in the manuscript, using the empirical and simulated data provided in the ‘MEG_Data’ and 'HNN_Simulations' directories respectively..
 *	**plot_fig3.m**
    *	This script plots Figure 3
    *   Simulated and empirical data associated with right/left contralateral AEFs
     
*	**plot_fig4.m**
    *	This script plots Figure 4
    *   Alternative models for left contralateral AEFs
    
* **plot_fig5.m**  
    *	This script plots Figure 5
    *   Simulated and empirical data associated with right/left contralateral/ipsilateral AEFs 

    

***
## MEG_Data
The ‘MEG_Data’ directory contains magnetoencephalographic data (MEG) collected from ten human participants who were presented with 1kHz sine wave tones. 
Here, we provide one .txt file per condition, each containing the source-localized grand-average AEFs (column 1: time steps in ms, column 2: MEG signal in nAm)
*	<span>**L_Contra**</span> contains data collected over the left hemisphere in response to stimuli presented on the right side (contralateral)
*	<span>**L_Ipsi**</span> contains data collected over the left hemisphere in response to stimuli presented on the left side  (ipsilateral)
*	<span>**R_Contra**</span> contains data collected over the right hemisphere in response to stimuli presented on the left side (contralateral)
*	<span>**R_Ipsi**</span> contains data collected over the right hemisphere in response to stimuli presented on the right side (ipsilateral)
***
## HNN_Parameters
The ‘HNN_Parameters’ directory contains one .param file per model. Each file contains all parameters required for a simulation in the Human Neocortical Neurosolver (HNN) software.
*	<span>**L_Contra**</span> contains parameters for the simulation of MEG_Data/L_Contra (see Manuscript Figure 3a-c & 5)
*	<span>**L_Ipsi**</span> contains parameters for the simulation of MEG_Data/L_Ipsi (see Manuscript Figure 5)
*	<span>**R_Contra**</span> contains parameters for the simulation of MEG_Data/R_Contra (see Manuscript Figure 3d-f &5)
*	<span>**R_Ipsi**</span> contains parameters for the simulation of MEG_Data/R_Ipsi (see Manuscript Figure 5)
*	<span>**L_Contra_Manually_Fitted**</span> contains parameters for the simulation of MEG_Data/R_Contra before automatic parameter optimzation (see Manuscript Figure 3b insert)
*	<span>**R_Contra_No_Smoothing**</span> contains parameters for the unsmoothed simulation of MEG_Data/R_Contra (see Supplementary Materials Figure S1)
*	<span>**Alternative_Ca**</span> contains parameters for the simulation of an alternative model of MEG_Data/L_Contra (by decreasing the synapctic gains in all connections targeting inhibitory interneurons, see Manuscript Figure 4a)
*	<span>Alternative_Gains</span> contains parameters for the simulation of an alternative model of MEG_Data/L_Contra (by decreasing Layer V pyramidal calcium channel densities, see Manuscript Figure 4b)
***
## HNN_Simulations
The ‘HNN_Simulations’ directory contains HNN output associated with each of the parameter files in 'HNN_Parameters'.
*	Each subdirectory corresponds to a parameter file in 'HNN_Parameters' and contains the following .txt files:  
    <sub> **dpl**	contains the averaged dipole *(column 1: time steps in ms, column 2: aggregate dipole, column 3: Layer II/III dipole, column 4: Layer V dipole)*   
     **dpl_0 - dpl_9**	contains the dipole associated with each trial *(here, 10 trials, column structure as in dpl)*   
     **rawdpl**	contains the raw (unnormalized, unscaled, unsmoothed) averaged dipole *(column structure as in dpl)*   
     **rawdpl_0 - rawdpl_9**	contains the raw dipole associated with each trial *(here, 10 trials, column structure as in dpl)*        </sub> 

***


Further information, code, and data may be available upon request. 
Please refer to the manuscript or contact: kohl.carmen.1@gmail.com. 
For further information regarding the Human Neocortical Neurosolver, or to run simulations using the parameter files provided,
please refer to [jonescompneurolab/hnn](https://github.com/jonescompneurolab/hnn) or [hnn.brown.edu](https://hnn.brown.edu/).
