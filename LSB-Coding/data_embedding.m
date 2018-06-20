
close all; clear all; clc;

[FileName,PathName] = uigetfile('.wav', 'Select cover audio:');
[file.path,file.name,file.ext] = fileparts([PathName FileName]);

wavin = [PathName FileName];
wavout = [file.path '\' file.name '_stego.wav'];
disp(wavout);

%password = 'password123';

password = (input('enter password : ', 's'));

file = 'text.txt';
fid  = fopen(file, 'r');
text = fread(fid,'*char')';
fclose(fid);

lsb_enc(wavin, wavout, text, password);