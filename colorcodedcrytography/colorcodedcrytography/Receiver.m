%% RECEIVER SIDE

% convert RGB image into singal channels R,G,B
Red = image(:,:,1); % Red channel
Green = image(:,:,2); % Green channel
Blue = image(:,:,3); % Blue channel
[row,col] = size(Red);
TR = Red(:)';
TG = Green(:)';
TB = Blue(:)';
%imaaa=cat(3,TR,TG,TB);
%val1=imaaa;
thcode = [];
for i=1:length(TR)
    V=[TR(i),TG(i),TB(i)];
    V(V==255)=1;
    thcode = [thcode,V];
end
if length(thcode) ~= length(hcode)
   thcode = [thcode,hcode(length(thcode)+1:length(hcode))];
end
%Huffman Decoding
dhsig1 = huffmandeco(thcode,dict);
output = char(dhsig1);
f=figure('Name','Decoding text file','NumberTitle','off','Position',[440,200,500,430],'Color',[0.9412 0.9412 0.9412]);
eth = uicontrol(f,'Style','text','String',output,'Position',[10 10 400 400],'fontsize',10,'fontname','Times New Roman','fontweight','Bold');
fid=fopen('Output\Decoded_Text.txt','w');
fprintf(fid,'%s\n',output');

%%