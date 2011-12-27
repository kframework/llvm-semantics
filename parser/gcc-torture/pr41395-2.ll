; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr41395-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.VEC_char_base = type { i32, i32, %union.anon }
%struct.anon = type { i32, i32, i32 }
%union.anon = type { %struct.anon }

define signext i16 @foo(%struct.VEC_char_base* %p, i32 %i) nounwind uwtable noinline {
entry:
  %p.addr = alloca %struct.VEC_char_base*, align 8
  %i.addr = alloca i32, align 4
  %q = alloca i16*, align 8
  store %struct.VEC_char_base* %p, %struct.VEC_char_base** %p.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* %i.addr, align 4
  %idxprom = sext i32 %tmp to i64
  %tmp1 = load %struct.VEC_char_base** %p.addr, align 8
  %u = getelementptr inbounds %struct.VEC_char_base* %tmp1, i32 0, i32 2
  %vec = bitcast %union.anon* %u to [1 x i16]*
  %arrayidx = getelementptr inbounds [1 x i16]* %vec, i32 0, i64 %idxprom
  store i16 0, i16* %arrayidx, align 2
  %tmp2 = load %struct.VEC_char_base** %p.addr, align 8
  %u3 = getelementptr inbounds %struct.VEC_char_base* %tmp2, i32 0, i32 2
  %vec4 = bitcast %union.anon* %u3 to [1 x i16]*
  %arrayidx5 = getelementptr inbounds [1 x i16]* %vec4, i32 0, i64 16
  store i16* %arrayidx5, i16** %q, align 8
  %tmp6 = load i16** %q, align 8
  store i16 1, i16* %tmp6
  %tmp7 = load i32* %i.addr, align 4
  %idxprom8 = sext i32 %tmp7 to i64
  %tmp9 = load %struct.VEC_char_base** %p.addr, align 8
  %u10 = getelementptr inbounds %struct.VEC_char_base* %tmp9, i32 0, i32 2
  %vec11 = bitcast %union.anon* %u10 to [1 x i16]*
  %arrayidx12 = getelementptr inbounds [1 x i16]* %vec11, i32 0, i64 %idxprom8
  %tmp13 = load i16* %arrayidx12, align 2
  ret i16 %tmp13
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.VEC_char_base*, align 8
  store i32 0, i32* %retval
  %call = call i8* @malloc(i32 276)
  %0 = bitcast i8* %call to %struct.VEC_char_base*
  store %struct.VEC_char_base* %0, %struct.VEC_char_base** %p, align 8
  %tmp = load %struct.VEC_char_base** %p, align 8
  %call1 = call signext i16 @foo(%struct.VEC_char_base* %tmp, i32 16)
  %conv = sext i16 %call1 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare i8* @malloc(i32)

declare void @abort() noreturn
