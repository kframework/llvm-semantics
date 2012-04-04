; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960117-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.T_VALS = type <{ i8* }>
%struct.T_VAL = type <{ i16, %union.T_VALS }>

@curval = global { i16, %union.T_VALS } zeroinitializer, align 2
@idc = internal global i16 0, align 2
@id_space = internal global [2 x [33 x i8]] zeroinitializer, align 16
@cur_line = internal global i32 0, align 4
@char_pos = internal global i32 0, align 4

define zeroext i16 @get_id(i8 signext %c) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  store i8 %c, i8* %c.addr, align 1
  %0 = load i8* %c.addr, align 1
  %1 = load i8** getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 1, i32 0), align 2
  %arrayidx = getelementptr inbounds i8* %1, i64 0
  store i8 %0, i8* %arrayidx, align 1
  ret i16 0
}

define zeroext i16 @get_tok() nounwind uwtable {
entry:
  %c = alloca i8, align 1
  store i8 99, i8* %c, align 1
  %0 = load i16* @idc, align 2
  %idxprom = sext i16 %0 to i64
  %arrayidx = getelementptr inbounds [2 x [33 x i8]]* @id_space, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [33 x i8]* %arrayidx, i32 0, i32 0
  store i8* %arraydecay, i8** getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 1, i32 0), align 2
  %1 = load i32* @cur_line, align 4
  %shl = shl i32 %1, 10
  %2 = load i32* @char_pos, align 4
  %or = or i32 %shl, %2
  %conv = trunc i32 %or to i16
  store i16 %conv, i16* getelementptr inbounds (%struct.T_VAL* bitcast ({ i16, %union.T_VALS }* @curval to %struct.T_VAL*), i32 0, i32 0), align 2
  %3 = load i8* %c, align 1
  %call = call zeroext i16 @get_id(i8 signext %3)
  ret i16 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call zeroext i16 @get_tok()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
