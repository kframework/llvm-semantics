; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/ipa-sra-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.bovid = type { float, i32, i8* }

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %tmp = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %tmp, 2000
  %conv = zext i1 %cmp to i32
  %call = call i32 @ox(i32 %conv, %struct.bovid* null)
  store i32 %call, i32* %r, align 4
  %tmp1 = load i32* %r, align 4
  ret i32 %tmp1
}

define internal i32 @ox(i32 %fail, %struct.bovid* %cow) nounwind uwtable noinline {
entry:
  %fail.addr = alloca i32, align 4
  %cow.addr = alloca %struct.bovid*, align 8
  %r = alloca i32, align 4
  store i32 %fail, i32* %fail.addr, align 4
  store %struct.bovid* %cow, %struct.bovid** %cow.addr, align 8
  %tmp = load i32* %fail.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load %struct.bovid** %cow.addr, align 8
  %red = getelementptr inbounds %struct.bovid* %tmp1, i32 0, i32 0
  %tmp2 = load float* %red, align 4
  %conv = fptosi float %tmp2 to i32
  store i32 %conv, i32* %r, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* %r, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp3 = load i32* %r, align 4
  ret i32 %tmp3
}
