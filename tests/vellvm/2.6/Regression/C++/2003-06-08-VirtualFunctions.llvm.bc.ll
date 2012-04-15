; ModuleID = '2003-06-08-VirtualFunctions.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__class_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__si_class_type_info_pseudo = type { %struct.__type_info_pseudo, %"struct.std::type_info"* }
%struct.__type_info_pseudo = type { i8*, i8* }
%struct.bar = type { %struct.foo }
%struct.foo = type { i32 (...)**, i32 }
%"struct.std::type_info" = type opaque

define i32 @main() nounwind readnone {
entry:
  ret i32 0
}
