//configuration of LLVM defines the program states of running LLVM programs
requires "llvm-syntax.k"
requires "llvm-abstractsyntax.k"
requires "llvm-settings.k"
requires "llvm-helpers.k"

module LLVM-CONFIGURATION
    imports LLVM-SYNTAX
    imports LLVM-ABSTRACTSYNTAX
    imports LLVM-SETTINGS
    imports LLVM-HELPERS

    configuration
        <T>//top level
            <brk> loc(startMemoryLoc, void,
              value(nullMemoryLoc,nullMemoryLoc),heap, none, none) </brk>
            //this is a cell holding brk pointer
            <cbd> .Map </cbd> //common data bus
            <exBuffer> .List </exBuffer>
            //a cell to hold all to commit memory ops, simulating computer north bridge
            <matchPhisWithInEdges> .List </matchPhisWithInEdges>
            //a helper cell to store all phi edges that have not been type checked
            <checkUseCount> 0 </checkUseCount>
            //a counter cell to generate free vars for use checks, should be deleted
            <instructionCounter> 0 </instructionCounter>
            //a counter cell to genearte free vars for instruction location num
            <tempGlobalVars> .List </tempGlobalVars> //use for store unnamed addr global vars
            <tempUses> .Set </tempUses> //set from use vars
            <tempLabelUses> .Set </tempLabelUses>
            <tempExceptionUses> .Set </tempExceptionUses>
            <tempLandingpads> .List </tempLandingpads>
            <tempResumes> .List </tempResumes>
            <tempBlockAddrChecks> .Set </tempBlockAddrChecks>
            <tempBlockMap> .Map </tempBlockMap> //set for store inst map for a block
            <thread multiplicity="*"> //thread cell
                <threadId> 0 </threadId> //thread id
                <buffer> .List </buffer> //thread execution buffer, items will be moved to exBuffer
                <k color="LightGreen"> $PGM:Module ~> initGlobals ~> callMain </k>
                //main cell containing program code
                <tomasulo>
                    <toExecute> .K </toExecute>
                    <instQueue> instList(.List) </instQueue> //instruction queue
                    <cpu> .K </cpu> //central execution unit
                    <toCommit> memList(.List, .List, .List, .List, .List) </toCommit>
                    <readBack> readMap(.Map) </readBack>
                    <currChoice> .Map </currChoice>
                    <specChoice> allowChoice(.Map) </specChoice>
                    <reverseChoice> .Map </reverseChoice>
                    <restChoice> .Map </restChoice>
                    <blockCount> 0 </blockCount> //model cpu: tomasulo
                </tomasulo>//simulating tomosulo execution model.
                <stack>
                   <stackOpList> .List </stackOpList>
                   <nextStack> startMemoryLoc </nextStack>
                    <stackList> .List </stackList>
                   <callStack color="Goldenrod"> .List </callStack>
                   <stackMap> .Map </stackMap>
                </stack>
                //stack for function calls
                <control color="LightGoldenrod">
                    <prevBlock color="Orchid"> .K </prevBlock>
                    <currBlock color="Orchid"> basicBlockNum(0, name(localVar, "Initial")) </currBlock>
                    //the current executing basic block
                    <currModule color="Orchid"> name(globalVar, "main") </currModule>
                    //current module
                    <currFunction color="Orchid"> name(globalVar, "Initial") </currFunction>
                    //current function that is being executed
                    <valist> .List </valist> //a cell storing variable argument list info
                    <expResume> .K </expResume>
                    <registers color="teal"> .Map </registers>
                    <specRegisters color="teal"> .Map </specRegisters>
                    //registers (infinite) for a thread
                    // TODO: this should eventually be a Set
                    <currentProgPoint> 0 </currentProgPoint>
                    //current program point (inst num), may not need
                    <currentModifiers color="Orchid"> .Set </currentModifiers>
                    //the modifiers (attributes) for the current functions
                    <currentMetadatas color="Orchid"> .ElemList </currentMetadatas>
                    //the metadatas for the current function
                    <localMemory> .Set </localMemory>
                    //local memory (stack) 
                </control> //control panel for function and basic blocks
            </thread>
            <stackObjects>
                   <stackObject multiplicity="*" color="LightSkyBlue">
                     <stackThreadId> 0 </stackThreadId> 
                     <stackChunckRange> .K </stackChunckRange>
                     <stackChunck> .List </stackChunck>
                     <stackSize> -1 </stackSize>
                     <stackAlign> 0 </stackAlign>
                     <stackAddrSpace> 0 </stackAddrSpace>
                     <stackRange> .K </stackRange>
                   </stackObject>
            </stackObjects>
            <memory color="teal" type="Map"> //main memory, heap
                <object multiplicity="*" color="LightSkyBlue">
                  <chunckRange> .K </chunckRange>
                  <chunck> .List </chunck>
                  <size> -1 </size>
                  <align> 0 </align>
                  <range> .K </range>
                  <addrSpace> 0 </addrSpace>
                  <complete> .Map </complete>
                    //use for non atomic loads/stores to count bytes they read/write
                  <race> .Set </race> //use to store the inst nums when a non-atomic load/store
                    //is accessing this field. 
                </object>
                <nextBase color="gray"> startMemoryLoc </nextBase>
                //this is a cell to calculate the next memory start location.
                <memOpList> .List </memOpList>
                <memoryRange> value(startMemoryLoc, startMemoryLoc) </memoryRange>
                <memoryList> .List </memoryList>
                //a cell to hold the current all memory locations
                <byteMap> .Map </byteMap>
            </memory>
            // auxiliary cells:
            <output stream="stdout" color="DodgerBlue"> .List </output>
             //output channel, like standard output
            <modules color="teal"> //static information about a module
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> name(globalVar, "") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <typedefs> .Map </typedefs> //type definition
                    <savedGlobals> .K </savedGlobals>
                    <globalFunVarCounter> 0 </globalFunVarCounter>
                    <attributeGroups> .Map </attributeGroups>
                    <metaGroups> .Map </metaGroups>
                    <globalTypes color="teal"> .Map </globalTypes>
                    <globalRegisters color="teal"> .Map </globalRegisters>
                    <typeInfos color="teal">
                        <typeInfo multiplicity="*" color="LightSkyBlue">
                            <typeName color="orange"> name(globalVar, "") </typeName>
                            <offsets> .Map </offsets>
                        </typeInfo>
                    </typeInfos> //type information for the module (global types, might delete)
                </module>
            </modules>
            <functions color="teal"> //static info for functions in a module
                 <builtinFunctions> .Set </builtinFunctions> //builtin functions, might not need
                 <function multiplicity="*" color="LightSkyBlue">
                       <funModuleName color="orange"> name(globalVar, "") </funModuleName>
                        //the module the function is belong to.
                       <functionName color="orange"> name(globalVar, "") </functionName>
                       //name of the function
                       <funSize> 0 </funSize>
                       <funPosition> 0 </funPosition>
                       <funModifiers> .Set </funModifiers> //function attributes
                       <varTypes color="teal"> .Map </varTypes> //variable types in a function
                       <returnType> .K </returnType> //return type of the function
                       <formalParameters> .K </formalParameters> //parameters of a function
                       <basicBlocks> .Map </basicBlocks> //basic blocks
                       <localFunVarCounter> 0 </localFunVarCounter> //a counter to generate free vars
                       <initialBasicBlock> .K </initialBasicBlock> //the entry block
                       <labels> .Set </labels> //function labels, might delete
                 </function>
            </functions>
        </T>
        <result multiplicity="?" color="DodgerBlue">
            <returnValue> -1 </returnValue>
        </result> //result of a computation, might delete

endmodule
