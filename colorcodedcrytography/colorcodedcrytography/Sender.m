%Huffman Coding on image
%clearing all variableas and screen
clear all;
close all;
clc;
%% Sender Side
%% Input Text
[filename, pathname] = uigetfile('Textfile\*.txt');    %Reading text file
I = textread([pathname,filename],'%s');
f=figure('Name','Sender side text file','NumberTitle','off','Position',[440,200,500,430],'Color',[0.9412 0.9412 0.9412]);
eth = uicontrol(f,'Style','text','String',I,'Position',[10 100 500 550],'fontsize',10,'fontname','Times New Roman','fontweight','Bold');
c=[];
for i=1:length(I)
a=I{i};
b=double(a);
c =[c,b];
end

%% Huffman Encoding
%Huffman code Dictionary

pro(1:length(unique(c))) = 0;
randpos = [1:10];
pro(randpos) = 0.1;
symbols = unique(c); %Symbols for an text
dict = huffmandict(symbols,pro);
hcode = huffmanenco(c,dict);
%% Image Conversion
[m,n]=size(hcode);
count=1;
for i=1:3:n
  if i < n-1
  val = hcode(i:i+2);
  val(val==1)=255;
  Rtemp(count)=val(1);
  Gtemp(count)=val(2);
  Btemp(count)=val(3);
  count=count+1;
  end
end 
sval = hcode(n-1:n);
[m,n]=size(Rtemp);
for i=n 
    for n1=10:n
    R2=rem(n,n1);
    if (R2==0)
    n2 = n1;
    break;
    end
    end   
end
n11 = n/n2;
R = reshape( Rtemp,n11,n2);
G = reshape( Gtemp,n11,n2);
B = reshape( Btemp,n11,n2);
image=cat(3,R,G,B);
Receiversideimage=(uint8(image));
figure('Name','Receiver Side Image','Numbertitle','Off'); imshow(Receiversideimage);

%% 