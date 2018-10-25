%funzione che controlla la somiglianza del target corrente, con quello di
%riferimento. Serve per capire se vi è offuscamento dovuto a nebbia o altro
function[correlaz_target]=check_target_cross(target_rif,target_curr)

%cor=xcorr2(double(image),double(target));%cerca i target con la cross-correlazione
%
%There is a subtle difference between normxcorr2 and xcorr2 in their function call syntaxes. 
%For normxcorr2(A,B), the function slides A through B. Therefore, normxcorr2(Template,Image) 
%means that it looks for the match of Template in Image. For xcorr2(A,B), the function 
%actually slides B through A. Therefore, to achieve the similar functionality as in normxcorr2, 
%it has to be invoked in the form of xcorr2(Image, Template). Unlike normxcorr2 though, xcorr2 
%does not require the size of B to be larger than size of A, so you may not notice it at all but the result becomes unexpected.
%
%cor_target=normxcorr2(double(target_curr),double(target_rif));%cerca i target con la cross-correlazione
%cor_target=corr2(double(target_curr),double(target_rif));%cerca i target con la cross-correlazione
%cor_target=xcorr2(double(target_curr),double(target_rif));%cerca i target con la cross-correlazione 
%correlaz_target=max(max(cor_target))/1000000;
%correlaz_target=max(max(cor_target));

 
% Calculate the Normalized Histogram of Image 1 and Image 2
hn1 = imhist(im2double(target_curr))./numel(im2double(target_curr));
hn2 = imhist(im2double(target_rif))./numel(im2double(target_rif));
 
% Calculate the histogram error
correlaz_target= sum((hn1 - hn2).^2)*10000;

 

%clear x1 y1 mas ma imag coord thi the minx maxy x y Q a