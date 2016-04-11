// Copyright (c) 2013-2015 K Team. All Rights Reserved.
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
        <T multiplicity="?">
            <k color="LightGreen"> $PGM:Module ~> initGlobals ~> callMain </k>
            <callStack color="Goldenrod"> .List </callStack>
            <nextLoc color="gray"> loc(startMemoryLoc +Int 1, 0, undef, undef) </nextLoc>
            <brk> loc(startMemoryLoc, 0, undef, undef) </brk>
            <control color="LightGoldenrod">
                <currBlock color="Orchid"> name(labelVar, "Initial") </currBlock>
                <prevBlock color="Orchid"> name(labelVar, "Initial") </prevBlock>
                <currModule color="Orchid"> name(labelVar, "main") </currModule>
                <currFunction color="Orchid"> name(globalVar, "Initial") </currFunction>
                <valist> .List </valist>
                <registers color="teal"> .Map </registers>
                // TODO: this should eventually be a Set
                <currentModifiers color="Orchid"> .Set </currentModifiers>
                <currentMetadatas color="Orchid"> .ElemList </currentMetadatas>
                <localMemory> .List </localMemory>
            </control>
            <memory color="teal" type="Map">
                <object multiplicity="*" color="LightSkyBlue">
                    <basePtr color="orange" type="Key"> -1 </basePtr>
                    <type> .K </type>
                    <size> 0 </size>
                    <bytes> .Map </bytes>
                </object>
            </memory>
            // auxiliary cells:
            <gepInfo multiplicity="?" color="red">
                <gepType> .K </gepType>
                <gepResult> 0 </gepResult>
                <gepIndices> .K </gepIndices>
            </gepInfo>
            <output stream="stdout" color="DodgerBlue"> .List </output>
            <modules color="teal">
                <module multiplicity="*" color="LightSkyBlue">
                    <moduleName color="orange"> name(labelVar, "") </moduleName>
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
                       <funModuleName color="orange"> name(labelVar, "") </funModuleName>
                       <functionName color="orange"> name(globalVar, "") </functionName>
                       <funModifiers> .Set </funModifiers>
                       <varTypes color="teal"> .Map </varTypes>
                       <returnType> .K </returnType>
                       <formalParameters> .K </formalParameters>
                       <basicBlocks> .Map </basicBlocks>
                       <localFunVarCounter> 0 </localFunVarCounter>
                       <initialBasicBlock> .K </initialBasicBlock>
                 </function>
            </functions>
        </T>
        <result multiplicity="?" color="DodgerBlue">
            <returnValue> -1 </returnValue>
        </result>

endmodule
