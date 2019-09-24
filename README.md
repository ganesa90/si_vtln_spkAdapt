This repository contains matlab code for performing VTLN speaker adaptation
as described in the paper titled "Unsupervised speaker adaptation for speaker independent
acoustic to articulatory speech inversion" https://asa.scitation.org/doi/10.1121/1.5116130

Directories:
data/XRMB_database - Contains a sample subset of the audio files from XRMB dataset for experiments
tools/ - Some Matlab tools that may be required to run the code
speaker_ubms/ - Directory to store the GMM speaker models

Scripts:
train_speaker_ubm.m - Script to trian the GMM models for each target speaker
speakerAdapt_vtln_sd.m - Script to run VTLN speaker adaptation. This code runs a grid search on the VTLN parameters to choose the best
			 parameter for each target speaker.

NOTE that in this repository we have not included the scripts for doing speech-inversion.
Given a pre-trained speaker-dependent speech inversion system for the target speaker, the user would
run the target speaker inversion model on  the spseaker adapted MFCC features of the test speaker.

For further questions, please contact: ganesa90 at gmail dot com

