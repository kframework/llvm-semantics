//
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
        <T>
            <nextLoc color="gray"> loc(startMemoryLoc +Int 1, 0, undef, undef) </nextLoc>
            <brk> loc(startMemoryLoc, 0, undef, undef) </brk>
            <exBuffer> .List </exBuffer>
            <memoryRange> value(startMemoryLoc, startMemoryLoc) </memoryRange>
            <matchPhisWithInEdges> .List </matchPhisWithInEdges>
            <checkUseCount> 0 </checkUseCount>
            <instructionCounter> 0 </instructionCounter>
            <tempBlockInst> .List </tempBlockInst>
            <checkAllUses>
                <checkUsesInBlock multiplicity="*">
                    <allUseNum> 0 </allUseNum>
                    <allCheckedBlocks> .Set </allCheckedBlocks>
                    <allCurrentJob> .K </allCurrentJob>
                    <checkUseResult>
                       false
                    </checkUseResult>
                </checkUsesInBlock>
            </checkAllUses>
            <checkExistUses>
                <checkUse multiplicity="*">
                   <existUseNum> 0 </existUseNum>
                   <checkedBlocks> .Set </checkedBlocks>
                   <currentJob> .K </currentJob>
                </checkUse>
            </checkExistUses>
            <thread multiplicity="*">
                <threadId> 0 </threadId>
                <buffer> .List </buffer>
                <k color="LightGreen"> $PGM:Module ~> initGlobals ~> callMain </k>
                <cpu>
                    <instQueue> .List </instQueue>
                    <rob> .List </rob>
                    <toCommit> .List </toCommit>
                    <cdb> .List </cdb>
                    <reservations> .List </reservations>
                    <loads> .List </loads>
                    <specNextBlockMap> .Map </specNextBlockMap>
                    <blockCount> 0 </blockCount> //model cpu: tomasulo
                </cpu>
                <callStack color="Goldenrod"> .List </callStack>
                <control color="LightGoldenrod">
                    <currBlock color="Orchid"> basicBlockNum(0, name(localVar, "Initial")) </currBlock>
                    <prevBlock color="Orchid"> basicBlockNum(0, name(localVar, "Initial")) </prevBlock>
                    <currModule color="Orchid"> name(globalVar, "main") </currModule>
                    <currFunction color="Orchid"> name(globalVar, "Initial") </currFunction>
                    <valist> .List </valist>
                    <registers color="teal"> .Map </registers>
                    // TODO: this should eventually be a Set
                    <currentProgPoint> 0 </currentProgPoint>
                    <currentModifiers color="Orchid"> .Set </currentModifiers>
                    <currentMetadatas color="Orchid"> .ElemList </currentMetadatas>
                    <localMemory> .List </localMemory>
                </control>
            </thread>
            <memory color="teal" type="Map">
                <object multiplicity="*" color="LightSkyBlue">
                    <basePtr color="orange" type="Key"> -1 </basePtr>
                    <type> .K </type>
                    <size> 0 </size>
                    <align> 'alignEmpty(.KList) </align>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            // auxiliary cells:
            <output stream="stdout" color="DodgerBlue"> .List </output>
            <modules color="teal">
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> name(globalVar, "") </moduleName>
                    <targetLayout> "" </targetLayout>
                    <targetTriple> "" </targetTriple>
                    <typedefs> .Map </typedefs>
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
                    </typeInfos>
                </module>
            </modules>
            <functions color="teal">
                 <builtinFunctions> .Set </builtinFunctions>
                 <function multiplicity="*" color="LightSkyBlue">
                       <funModuleName color="orange"> name(globalVar, "") </funModuleName>
                       <functionName color="orange"> name(globalVar, "") </functionName>
                       <funModifiers> .Set </funModifiers>
                       <varTypes color="teal"> .Map </varTypes>
                       <returnType> .K </returnType>
                       <formalParameters> .K </formalParameters>
                       <basicBlocks> .Map </basicBlocks>
                       <localFunVarCounter> 0 </localFunVarCounter>
                       <initialBasicBlock> .K </initialBasicBlock>
                       //<blockPathMap> .Map </blockPathMap>
                       //<dependency> .List </dependency>
                       <defToInstNum> .Map </defToInstNum> //mapping from def name to inst num
                       <instNumToBlock> .Map  </instNumToBlock> //inst number map to block name
                       <instNumInfo> .Map  </instNumInfo>
                       //<samePointerLoc> .List </samePointerLoc>//those locations are possibly the same
                 </function>
            </functions>
        </T>
        <result multiplicity="?" color="DodgerBlue">
            <returnValue> -1 </returnValue>
        </result>

endmodule
