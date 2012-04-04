; ModuleID = '/home/david/src/c-semantics/tests/mustPass/xAddrStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type { %struct.node*, i32 }

@s = common global %struct.node zeroinitializer, align 8

define { %struct.node*, i32 } @f() nounwind uwtable {
entry:
  %retval = alloca %struct.node, align 8
  %0 = bitcast %struct.node* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.node* @s to i8*), i64 16, i32 8, i1 false)
  %1 = bitcast %struct.node* %retval to { %struct.node*, i32 }*
  %2 = load { %struct.node*, i32 }* %1, align 1
  ret { %struct.node*, i32 } %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %coerce = alloca %struct.node, align 8
  store i32 0, i32* %retval
  store %struct.node* @s, %struct.node** getelementptr inbounds (%struct.node* @s, i32 0, i32 0), align 8
  store i32 5, i32* getelementptr inbounds (%struct.node* @s, i32 0, i32 1), align 4
  %call = call { %struct.node*, i32 } @f()
  %0 = bitcast %struct.node* %coerce to { %struct.node*, i32 }*
  %1 = getelementptr { %struct.node*, i32 }* %0, i32 0, i32 0
  %2 = extractvalue { %struct.node*, i32 } %call, 0
  store %struct.node* %2, %struct.node** %1, align 1
  %3 = getelementptr { %struct.node*, i32 }* %0, i32 0, i32 1
  %4 = extractvalue { %struct.node*, i32 } %call, 1
  store i32 %4, i32* %3, align 1
  %p = getelementptr inbounds %struct.node* %coerce, i32 0, i32 0
  %5 = load %struct.node** %p, align 8
  ret i32 0
}
