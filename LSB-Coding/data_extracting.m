close all; clear all; clc;

[FileName,PathName] = uigetfile({'.wav'}, 'Select stego audio:');
wavin = [PathName FileName];

%password = 'password123';

password = (input('enter password : ', 's'));

msg = lsb_dec(wavin, password);
fprintf('Retrieved message: %s\n', msg);

file = 'text.txt';
fid  = fopen(file, 'r');
text = fread(fid,'*char')';
fclose(fid);


err = BER(text,msg);
nc  = NC(text, msg);

fprintf('BER : %d\n', err);
fprintf('NC : %d\n', nc);