
function [apen] = SymbolDynamicEntropy(data,m,numSymbol)

    partition = PartitionGeneration(data,numSymbol);
    
   %% 第二步，生成符号序列　
    symbolSeq=SymbolGeneration(data,partition);  
   %% 第三步，计算符号的SDF熵值
    apen = SymbolEntropy(symbolSeq, numSymbol, m);

end
