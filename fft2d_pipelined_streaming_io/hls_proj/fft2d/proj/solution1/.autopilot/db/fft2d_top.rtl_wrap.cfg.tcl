set lang "C++"
set moduleName "fft2d_top"
set moduleIsExternC "0"
set rawDecl ""
set globalVariable ""
set PortList ""
set PortName0 "xn"
set BitWidth0 "64"
set ArrayOpt0 ""
set Const0 "0"
set Volatile0 "0"
set Pointer0 "0"
set Reference0 "0"
set Dims0 [list 1024]
set Interface0 "wire"
set structMem0 ""
set PortName00 "data"
set BitWidth00 "64"
set ArrayOpt00 ""
set Const00 "0"
set Volatile00 "0"
set Pointer00 "0"
set Reference00 "0"
set Dims00 [list 0]
set Interface00 "wire"
set structMem00 ""
set PortName000 "real"
set BitWidth000 "32"
set ArrayOpt000 ""
set Const000 "0"
set Volatile000 "0"
set Pointer000 "0"
set Reference000 "0"
set Dims000 [list 0]
set Interface000 "wire"
set DataType000 "float"
set Port000 [list $PortName000 $Interface000 $DataType000 $Pointer000 $Dims000 $Const000 $Volatile000 $ArrayOpt000]
lappend structMem00 $Port000
set PortName001 "imag"
set BitWidth001 "32"
set ArrayOpt001 ""
set Const001 "0"
set Volatile001 "0"
set Pointer001 "0"
set Reference001 "0"
set Dims001 [list 0]
set Interface001 "wire"
set DataType001 "float"
set Port001 [list $PortName001 $Interface001 $DataType001 $Pointer001 $Dims001 $Const001 $Volatile001 $ArrayOpt001]
lappend structMem00 $Port001
set structParameter00 [list ]
set structArgument00 [list ]
set NameSpace00 [list ]
set structIsPacked00 "0"
set DataType00 [list "DATA_t" "struct " $structMem00 0 0 $structParameter00 $structArgument00 $NameSpace00 $structIsPacked00]
set Port00 [list $PortName00 $Interface00 $DataType00 $Pointer00 $Dims00 $Const00 $Volatile00 $ArrayOpt00]
lappend structMem0 $Port00
set PortName01 "last"
set BitWidth01 "8"
set ArrayOpt01 ""
set Const01 "0"
set Volatile01 "0"
set Pointer01 "0"
set Reference01 "0"
set Dims01 [list 0]
set Interface01 "wire"
set DataType01 "bool"
set Port01 [list $PortName01 $Interface01 $DataType01 $Pointer01 $Dims01 $Const01 $Volatile01 $ArrayOpt01]
lappend structMem0 $Port01
set structParameter0 [list ]
set structArgument0 [list ]
set NameSpace0 [list ]
set structIsPacked0 "0"
set DataType0 [list "AXIS_t" "struct " $structMem0 0 0 $structParameter0 $structArgument0 $NameSpace0 $structIsPacked0]
set Port0 [list $PortName0 $Interface0 $DataType0 $Pointer0 $Dims0 $Const0 $Volatile0 $ArrayOpt0]
lappend PortList $Port0
set PortName1 "xk"
set BitWidth1 "64"
set ArrayOpt1 ""
set Const1 "0"
set Volatile1 "0"
set Pointer1 "0"
set Reference1 "0"
set Dims1 [list 1024]
set Interface1 "wire"
set structMem1 ""
set PortName10 "data"
set BitWidth10 "64"
set ArrayOpt10 ""
set Const10 "0"
set Volatile10 "0"
set Pointer10 "0"
set Reference10 "0"
set Dims10 [list 0]
set Interface10 "wire"
set structMem10 ""
set PortName100 "real"
set BitWidth100 "32"
set ArrayOpt100 ""
set Const100 "0"
set Volatile100 "0"
set Pointer100 "0"
set Reference100 "0"
set Dims100 [list 0]
set Interface100 "wire"
set DataType100 "float"
set Port100 [list $PortName100 $Interface100 $DataType100 $Pointer100 $Dims100 $Const100 $Volatile100 $ArrayOpt100]
lappend structMem10 $Port100
set PortName101 "imag"
set BitWidth101 "32"
set ArrayOpt101 ""
set Const101 "0"
set Volatile101 "0"
set Pointer101 "0"
set Reference101 "0"
set Dims101 [list 0]
set Interface101 "wire"
set DataType101 "float"
set Port101 [list $PortName101 $Interface101 $DataType101 $Pointer101 $Dims101 $Const101 $Volatile101 $ArrayOpt101]
lappend structMem10 $Port101
set structParameter10 [list ]
set structArgument10 [list ]
set NameSpace10 [list ]
set structIsPacked10 "0"
set DataType10 [list "DATA_t" "struct " $structMem10 0 0 $structParameter10 $structArgument10 $NameSpace10 $structIsPacked10]
set Port10 [list $PortName10 $Interface10 $DataType10 $Pointer10 $Dims10 $Const10 $Volatile10 $ArrayOpt10]
lappend structMem1 $Port10
set PortName11 "last"
set BitWidth11 "8"
set ArrayOpt11 ""
set Const11 "0"
set Volatile11 "0"
set Pointer11 "0"
set Reference11 "0"
set Dims11 [list 0]
set Interface11 "wire"
set DataType11 "bool"
set Port11 [list $PortName11 $Interface11 $DataType11 $Pointer11 $Dims11 $Const11 $Volatile11 $ArrayOpt11]
lappend structMem1 $Port11
set structParameter1 [list ]
set structArgument1 [list ]
set NameSpace1 [list ]
set structIsPacked1 "0"
set DataType1 [list "AXIS_t" "struct " $structMem1 0 0 $structParameter1 $structArgument1 $NameSpace1 $structIsPacked1]
set Port1 [list $PortName1 $Interface1 $DataType1 $Pointer1 $Dims1 $Const1 $Volatile1 $ArrayOpt1]
lappend PortList $Port1
set globalAPint "" 
set returnAPInt "" 
set hasCPPAPInt 0 
set argAPInt "" 
set hasCPPAPFix 0 
set hasSCFix 0 
set hasCBool 0 
set hasCPPComplex 0 
set isTemplateTop 0
set hasHalf 0 
set dataPackList ""
set module [list $moduleName $PortList $rawDecl $argAPInt $returnAPInt $dataPackList]
