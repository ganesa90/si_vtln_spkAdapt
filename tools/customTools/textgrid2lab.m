function     textgrid2lab( inFile, outFile, option ) 

if option==1
    strType = '"phone"' ; 
end
if option==2
    strType = '"word"' ; 
end

fp = fopen( inFile ) ; 

% locating the phonemes
while ~feof(fp) 
    lineString = fgets( fp ) ;
   % fprintf(1, '%s\n', lineString) ;
%    if (strcmpi( lineString(1:end-1), '"Phonemes"') ), break ; end ;  % remove the newline character in the end    
%    if (strcmpi( lineString(1:end-1), '"phone"') ), break ; end ;  % remove the newline character in the end    
    if (strcmpi( lineString(1:end-1), strType) ), break ; end ;  % remove the newline character in the end    
end

tmpStr = fgets( fp ) ;
stT    = str2num( tmpStr ) ; 
tmpStr = fgets( fp ) ;
edT    = str2num( tmpStr ) ; 
numPhonmes = str2num( fgets( fp ) ) ;

for k =  1 : numPhonmes
    t1(k) = str2num( fgets( fp ) ) ; 
    t2(k) = str2num( fgets( fp ) ) ; 
    phonemes{k} = ( fgets( fp ) ) ; 
end
fclose( fp ) ; 

% write to a new lable file
fp = fopen( outFile, 'w' ) ; 
for k =  1 : numPhonmes
  %  if( strcmpi( phonemes{k}(1:end-1), '"#"' ) ), continue ; end ; 
    fprintf(fp, '%f %f %s\n', t1(k), t2(k), phonemes{k}(1:end-1)) ;
end
fclose( fp ) ; 



return ; 

