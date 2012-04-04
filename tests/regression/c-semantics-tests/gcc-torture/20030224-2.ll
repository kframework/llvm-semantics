; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030224-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.node = type <{ %struct.jint16_t, %struct.jint16_t, i32 }>
%struct.jint16_t = type <{ i16 }>

@node = common global %struct.node zeroinitializer, align 1
@node_p = global %struct.node* @node, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %marker = alloca %struct.node, align 1
  %.compoundliteral = alloca %struct.jint16_t, align 1
  %.compoundliteral1 = alloca %struct.jint16_t, align 1
  store i32 0, i32* %retval
  %magic = getelementptr inbounds %struct.node* %marker, i32 0, i32 0
  %v16 = getelementptr inbounds %struct.jint16_t* %.compoundliteral, i32 0, i32 0
  store i16 6533, i16* %v16, align 1
  %0 = bitcast %struct.jint16_t* %magic to i8*
  %1 = bitcast %struct.jint16_t* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 2, i32 1, i1 false)
  %nodetype = getelementptr inbounds %struct.node* %marker, i32 0, i32 1
  %v162 = getelementptr inbounds %struct.jint16_t* %.compoundliteral1, i32 0, i32 0
  store i16 8195, i16* %v162, align 1
  %2 = bitcast %struct.jint16_t* %nodetype to i8*
  %3 = bitcast %struct.jint16_t* %.compoundliteral1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 2, i32 1, i1 false)
  %totlen = getelementptr inbounds %struct.node* %marker, i32 0, i32 2
  %4 = load %struct.node** @node_p, align 8
  %totlen3 = getelementptr inbounds %struct.node* %4, i32 0, i32 2
  %5 = load i32* %totlen3, align 1
  store i32 %5, i32* %totlen, align 1
  %magic4 = getelementptr inbounds %struct.node* %marker, i32 0, i32 0
  %v165 = getelementptr inbounds %struct.jint16_t* %magic4, i32 0, i32 0
  %6 = load i16* %v165, align 1
  %conv = sext i16 %6 to i32
  %cmp = icmp ne i32 %conv, 6533
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %nodetype7 = getelementptr inbounds %struct.node* %marker, i32 0, i32 1
  %v168 = getelementptr inbounds %struct.jint16_t* %nodetype7, i32 0, i32 0
  %7 = load i16* %v168, align 1
  %conv9 = sext i16 %7 to i32
  %cmp10 = icmp ne i32 %conv9, 8195
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
