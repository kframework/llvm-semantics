; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/rem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [37 x i8] c"Test #%u, failed in iteration #: %u\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"Failing test vector:\0A\00", align 1
@.str2 = private unnamed_addr constant [54 x i8] c"m=%u, x_u=%u, y_u=%u, z_u=%u, x_s=%d, y_s=%d, z_s=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"\0A *** REM test done! ***\0A\00", align 1

define i64 @gcd(i64 %a, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  %c = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  %0 = load i64* %a.addr, align 8
  %1 = load i64* %b.addr, align 8
  %rem = srem i64 %0, %1
  store i64 %rem, i64* %c, align 8
  %2 = load i64* %c, align 8
  %cmp = icmp eq i64 %2, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %3 = load i64* %b.addr, align 8
  ret i64 %3

if.end:                                           ; preds = %while.body
  %4 = load i64* %b.addr, align 8
  store i64 %4, i64* %a.addr, align 8
  %5 = load i64* %c, align 8
  store i64 %5, i64* %b.addr, align 8
  br label %while.body
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %idx = alloca i32, align 4
  %m = alloca i32, align 4
  %x_u = alloca i32, align 4
  %y_u = alloca i32, align 4
  %z_u = alloca i32, align 4
  %x_s = alloca i32, align 4
  %y_s = alloca i32, align 4
  %z_s = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %idx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %idx, align 4
  %cmp = icmp ult i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call = call i32 @rand() nounwind
  store i32 %call, i32* %m, align 4
  %1 = load i32* %m, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %2 = load i32* %idx, align 4
  %dec = add i32 %2, -1
  store i32 %dec, i32* %idx, align 4
  br label %for.inc

if.end:                                           ; preds = %for.body
  %call2 = call i32 @rand() nounwind
  store i32 %call2, i32* %x_u, align 4
  %call3 = call i32 @rand() nounwind
  store i32 %call3, i32* %y_u, align 4
  %call4 = call i32 @rand() nounwind
  store i32 %call4, i32* %z_u, align 4
  %call5 = call i32 @rand() nounwind
  %rem = srem i32 %call5, 2
  %tobool = icmp ne i32 %rem, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %call6 = call i32 @rand() nounwind
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %call7 = call i32 @rand() nounwind
  %sub = sub nsw i32 0, %call7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call6, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* %x_s, align 4
  %call8 = call i32 @rand() nounwind
  %rem9 = srem i32 %call8, 2
  %tobool10 = icmp ne i32 %rem9, 0
  br i1 %tobool10, label %cond.true11, label %cond.false13

cond.true11:                                      ; preds = %cond.end
  %call12 = call i32 @rand() nounwind
  br label %cond.end16

cond.false13:                                     ; preds = %cond.end
  %call14 = call i32 @rand() nounwind
  %sub15 = sub nsw i32 0, %call14
  br label %cond.end16

cond.end16:                                       ; preds = %cond.false13, %cond.true11
  %cond17 = phi i32 [ %call12, %cond.true11 ], [ %sub15, %cond.false13 ]
  store i32 %cond17, i32* %y_s, align 4
  %call18 = call i32 @rand() nounwind
  %rem19 = srem i32 %call18, 2
  %tobool20 = icmp ne i32 %rem19, 0
  br i1 %tobool20, label %cond.true21, label %cond.false23

cond.true21:                                      ; preds = %cond.end16
  %call22 = call i32 @rand() nounwind
  br label %cond.end26

cond.false23:                                     ; preds = %cond.end16
  %call24 = call i32 @rand() nounwind
  %sub25 = sub nsw i32 0, %call24
  br label %cond.end26

cond.end26:                                       ; preds = %cond.false23, %cond.true21
  %cond27 = phi i32 [ %call22, %cond.true21 ], [ %sub25, %cond.false23 ]
  store i32 %cond27, i32* %z_s, align 4
  %3 = load i32* %x_s, align 4
  %4 = load i32* %y_s, align 4
  %cmp28 = icmp ne i32 %3, %4
  br i1 %cmp28, label %if.end36, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %cond.end26
  %5 = load i32* %x_s, align 4
  %6 = load i32* %m, align 4
  %rem29 = urem i32 %5, %6
  %7 = load i32* %y_s, align 4
  %8 = load i32* %m, align 4
  %rem30 = urem i32 %7, %8
  %cmp31 = icmp eq i32 %rem29, %rem30
  br i1 %cmp31, label %if.end36, label %if.then32

if.then32:                                        ; preds = %lor.lhs.false
  %9 = load i32* %idx, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 1, i32 %9)
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %10 = load i32* %m, align 4
  %11 = load i32* %x_u, align 4
  %12 = load i32* %y_u, align 4
  %13 = load i32* %z_u, align 4
  %14 = load i32* %x_s, align 4
  %15 = load i32* %y_s, align 4
  %16 = load i32* %z_s, align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16)
  store i32 1, i32* %retval
  br label %return

if.end36:                                         ; preds = %lor.lhs.false, %cond.end26
  %17 = load i32* %x_s, align 4
  %18 = load i32* %y_u, align 4
  %cmp37 = icmp ne i32 %17, %18
  br i1 %cmp37, label %if.end46, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.end36
  %19 = load i32* %x_s, align 4
  %20 = load i32* %m, align 4
  %rem39 = urem i32 %19, %20
  %21 = load i32* %y_u, align 4
  %22 = load i32* %m, align 4
  %rem40 = urem i32 %21, %22
  %cmp41 = icmp eq i32 %rem39, %rem40
  br i1 %cmp41, label %if.end46, label %if.then42

if.then42:                                        ; preds = %lor.lhs.false38
  %23 = load i32* %idx, align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 2, i32 %23)
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %24 = load i32* %m, align 4
  %25 = load i32* %x_u, align 4
  %26 = load i32* %y_u, align 4
  %27 = load i32* %z_u, align 4
  %28 = load i32* %x_s, align 4
  %29 = load i32* %y_s, align 4
  %30 = load i32* %z_s, align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %24, i32 %25, i32 %26, i32 %27, i32 %28, i32 %29, i32 %30)
  store i32 1, i32* %retval
  br label %return

if.end46:                                         ; preds = %lor.lhs.false38, %if.end36
  %31 = load i32* %x_u, align 4
  %32 = load i32* %y_s, align 4
  %cmp47 = icmp ne i32 %31, %32
  br i1 %cmp47, label %if.end56, label %lor.lhs.false48

lor.lhs.false48:                                  ; preds = %if.end46
  %33 = load i32* %x_u, align 4
  %34 = load i32* %m, align 4
  %rem49 = urem i32 %33, %34
  %35 = load i32* %y_s, align 4
  %36 = load i32* %m, align 4
  %rem50 = urem i32 %35, %36
  %cmp51 = icmp eq i32 %rem49, %rem50
  br i1 %cmp51, label %if.end56, label %if.then52

if.then52:                                        ; preds = %lor.lhs.false48
  %37 = load i32* %idx, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 3, i32 %37)
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %38 = load i32* %m, align 4
  %39 = load i32* %x_u, align 4
  %40 = load i32* %y_u, align 4
  %41 = load i32* %z_u, align 4
  %42 = load i32* %x_s, align 4
  %43 = load i32* %y_s, align 4
  %44 = load i32* %z_s, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %38, i32 %39, i32 %40, i32 %41, i32 %42, i32 %43, i32 %44)
  store i32 1, i32* %retval
  br label %return

if.end56:                                         ; preds = %lor.lhs.false48, %if.end46
  %45 = load i32* %x_u, align 4
  %46 = load i32* %y_u, align 4
  %cmp57 = icmp ne i32 %45, %46
  br i1 %cmp57, label %if.end66, label %lor.lhs.false58

lor.lhs.false58:                                  ; preds = %if.end56
  %47 = load i32* %x_u, align 4
  %48 = load i32* %m, align 4
  %rem59 = urem i32 %47, %48
  %49 = load i32* %y_u, align 4
  %50 = load i32* %m, align 4
  %rem60 = urem i32 %49, %50
  %cmp61 = icmp eq i32 %rem59, %rem60
  br i1 %cmp61, label %if.end66, label %if.then62

if.then62:                                        ; preds = %lor.lhs.false58
  %51 = load i32* %idx, align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 4, i32 %51)
  %call64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %52 = load i32* %m, align 4
  %53 = load i32* %x_u, align 4
  %54 = load i32* %y_u, align 4
  %55 = load i32* %z_u, align 4
  %56 = load i32* %x_s, align 4
  %57 = load i32* %y_s, align 4
  %58 = load i32* %z_s, align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %52, i32 %53, i32 %54, i32 %55, i32 %56, i32 %57, i32 %58)
  store i32 1, i32* %retval
  br label %return

if.end66:                                         ; preds = %lor.lhs.false58, %if.end56
  %59 = load i32* %x_u, align 4
  %60 = load i32* %m, align 4
  %rem67 = urem i32 %59, %60
  %61 = load i32* %y_u, align 4
  %62 = load i32* %m, align 4
  %rem68 = urem i32 %61, %62
  %add = add i32 %rem67, %rem68
  %63 = load i32* %x_u, align 4
  %64 = load i32* %m, align 4
  %rem69 = urem i32 %63, %64
  %cmp70 = icmp ult i32 %add, %rem69
  br i1 %cmp70, label %if.end86, label %lor.lhs.false71

lor.lhs.false71:                                  ; preds = %if.end66
  %65 = load i32* %x_u, align 4
  %66 = load i32* %y_u, align 4
  %add72 = add i32 %65, %66
  %67 = load i32* %x_u, align 4
  %cmp73 = icmp ult i32 %add72, %67
  br i1 %cmp73, label %if.end86, label %lor.lhs.false74

lor.lhs.false74:                                  ; preds = %lor.lhs.false71
  %68 = load i32* %x_u, align 4
  %69 = load i32* %m, align 4
  %rem75 = urem i32 %68, %69
  %70 = load i32* %y_u, align 4
  %71 = load i32* %m, align 4
  %rem76 = urem i32 %70, %71
  %add77 = add i32 %rem75, %rem76
  %72 = load i32* %m, align 4
  %rem78 = urem i32 %add77, %72
  %73 = load i32* %x_u, align 4
  %74 = load i32* %y_u, align 4
  %add79 = add i32 %73, %74
  %75 = load i32* %m, align 4
  %rem80 = urem i32 %add79, %75
  %cmp81 = icmp eq i32 %rem78, %rem80
  br i1 %cmp81, label %if.end86, label %if.then82

if.then82:                                        ; preds = %lor.lhs.false74
  %76 = load i32* %idx, align 4
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 5, i32 %76)
  %call84 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %77 = load i32* %m, align 4
  %78 = load i32* %x_u, align 4
  %79 = load i32* %y_u, align 4
  %80 = load i32* %z_u, align 4
  %81 = load i32* %x_s, align 4
  %82 = load i32* %y_s, align 4
  %83 = load i32* %z_s, align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %77, i32 %78, i32 %79, i32 %80, i32 %81, i32 %82, i32 %83)
  store i32 1, i32* %retval
  br label %return

if.end86:                                         ; preds = %lor.lhs.false74, %lor.lhs.false71, %if.end66
  %84 = load i32* %y_u, align 4
  %85 = load i32* %z_u, align 4
  %add87 = add i32 %84, %85
  %86 = load i32* %y_u, align 4
  %cmp88 = icmp ult i32 %add87, %86
  br i1 %cmp88, label %if.end109, label %lor.lhs.false89

lor.lhs.false89:                                  ; preds = %if.end86
  %87 = load i32* %x_u, align 4
  %88 = load i32* %z_u, align 4
  %sub90 = sub i32 %87, %88
  %89 = load i32* %x_u, align 4
  %cmp91 = icmp ugt i32 %sub90, %89
  br i1 %cmp91, label %if.end109, label %lor.lhs.false92

lor.lhs.false92:                                  ; preds = %lor.lhs.false89
  %90 = load i32* %x_u, align 4
  %91 = load i32* %m, align 4
  %rem93 = urem i32 %90, %91
  %92 = load i32* %y_u, align 4
  %93 = load i32* %z_u, align 4
  %add94 = add i32 %92, %93
  %94 = load i32* %m, align 4
  %rem95 = urem i32 %add94, %94
  %cmp96 = icmp eq i32 %rem93, %rem95
  %conv = zext i1 %cmp96 to i32
  %95 = load i32* %m, align 4
  %rem97 = urem i32 %conv, %95
  %96 = load i32* %x_u, align 4
  %97 = load i32* %z_u, align 4
  %sub98 = sub i32 %96, %97
  %98 = load i32* %m, align 4
  %rem99 = urem i32 %sub98, %98
  %99 = load i32* %y_u, align 4
  %100 = load i32* %m, align 4
  %rem100 = urem i32 %99, %100
  %cmp101 = icmp eq i32 %rem99, %rem100
  %conv102 = zext i1 %cmp101 to i32
  %cmp103 = icmp eq i32 %rem97, %conv102
  br i1 %cmp103, label %if.end109, label %if.then105

if.then105:                                       ; preds = %lor.lhs.false92
  %101 = load i32* %idx, align 4
  %call106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 6, i32 %101)
  %call107 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %102 = load i32* %m, align 4
  %103 = load i32* %x_u, align 4
  %104 = load i32* %y_u, align 4
  %105 = load i32* %z_u, align 4
  %106 = load i32* %x_s, align 4
  %107 = load i32* %y_s, align 4
  %108 = load i32* %z_s, align 4
  %call108 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %102, i32 %103, i32 %104, i32 %105, i32 %106, i32 %107, i32 %108)
  store i32 1, i32* %retval
  br label %return

if.end109:                                        ; preds = %lor.lhs.false92, %lor.lhs.false89, %if.end86
  %109 = load i32* %y_u, align 4
  %110 = load i32* %m, align 4
  %mul = mul i32 %109, %110
  %111 = load i32* %m, align 4
  %div = udiv i32 %mul, %111
  %112 = load i32* %y_u, align 4
  %cmp110 = icmp ne i32 %div, %112
  br i1 %cmp110, label %if.end128, label %lor.lhs.false112

lor.lhs.false112:                                 ; preds = %if.end109
  %113 = load i32* %x_u, align 4
  %114 = load i32* %y_u, align 4
  %115 = load i32* %m, align 4
  %mul113 = mul i32 %114, %115
  %add114 = add i32 %113, %mul113
  %116 = load i32* %x_u, align 4
  %cmp115 = icmp ult i32 %add114, %116
  br i1 %cmp115, label %if.end128, label %lor.lhs.false117

lor.lhs.false117:                                 ; preds = %lor.lhs.false112
  %117 = load i32* %x_u, align 4
  %118 = load i32* %m, align 4
  %rem118 = urem i32 %117, %118
  %119 = load i32* %x_u, align 4
  %120 = load i32* %y_u, align 4
  %121 = load i32* %m, align 4
  %mul119 = mul i32 %120, %121
  %add120 = add i32 %119, %mul119
  %122 = load i32* %m, align 4
  %rem121 = urem i32 %add120, %122
  %cmp122 = icmp eq i32 %rem118, %rem121
  br i1 %cmp122, label %if.end128, label %if.then124

if.then124:                                       ; preds = %lor.lhs.false117
  %123 = load i32* %idx, align 4
  %call125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 7, i32 %123)
  %call126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %124 = load i32* %m, align 4
  %125 = load i32* %x_u, align 4
  %126 = load i32* %y_u, align 4
  %127 = load i32* %z_u, align 4
  %128 = load i32* %x_s, align 4
  %129 = load i32* %y_s, align 4
  %130 = load i32* %z_s, align 4
  %call127 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %124, i32 %125, i32 %126, i32 %127, i32 %128, i32 %129, i32 %130)
  store i32 1, i32* %retval
  br label %return

if.end128:                                        ; preds = %lor.lhs.false117, %lor.lhs.false112, %if.end109
  %131 = load i32* %z_s, align 4
  %conv129 = sext i32 %131 to i64
  %132 = load i32* %m, align 4
  %conv130 = zext i32 %132 to i64
  %call131 = call i64 @gcd(i64 %conv129, i64 %conv130)
  %cmp132 = icmp ne i64 %call131, 1
  br i1 %cmp132, label %if.end168, label %lor.lhs.false134

lor.lhs.false134:                                 ; preds = %if.end128
  %133 = load i32* %z_s, align 4
  %cmp135 = icmp eq i32 %133, 0
  br i1 %cmp135, label %if.end168, label %lor.lhs.false137

lor.lhs.false137:                                 ; preds = %lor.lhs.false134
  %134 = load i32* %x_s, align 4
  %conv138 = sext i32 %134 to i64
  %135 = load i32* %z_s, align 4
  %conv139 = sext i32 %135 to i64
  %call140 = call i64 @gcd(i64 %conv138, i64 %conv139)
  %136 = load i32* %z_s, align 4
  %conv141 = sext i32 %136 to i64
  %cmp142 = icmp ne i64 %call140, %conv141
  br i1 %cmp142, label %if.end168, label %lor.lhs.false144

lor.lhs.false144:                                 ; preds = %lor.lhs.false137
  %137 = load i32* %y_s, align 4
  %conv145 = sext i32 %137 to i64
  %138 = load i32* %z_s, align 4
  %conv146 = sext i32 %138 to i64
  %call147 = call i64 @gcd(i64 %conv145, i64 %conv146)
  %139 = load i32* %z_s, align 4
  %conv148 = sext i32 %139 to i64
  %cmp149 = icmp ne i64 %call147, %conv148
  br i1 %cmp149, label %if.end168, label %lor.lhs.false151

lor.lhs.false151:                                 ; preds = %lor.lhs.false144
  %140 = load i32* %x_s, align 4
  %141 = load i32* %m, align 4
  %rem152 = urem i32 %140, %141
  %142 = load i32* %y_s, align 4
  %143 = load i32* %m, align 4
  %rem153 = urem i32 %142, %143
  %cmp154 = icmp eq i32 %rem152, %rem153
  %conv155 = zext i1 %cmp154 to i32
  %144 = load i32* %x_s, align 4
  %145 = load i32* %z_s, align 4
  %div156 = sdiv i32 %144, %145
  %146 = load i32* %m, align 4
  %rem157 = urem i32 %div156, %146
  %147 = load i32* %y_s, align 4
  %148 = load i32* %z_s, align 4
  %div158 = sdiv i32 %147, %148
  %149 = load i32* %m, align 4
  %rem159 = urem i32 %div158, %149
  %cmp160 = icmp eq i32 %rem157, %rem159
  %conv161 = zext i1 %cmp160 to i32
  %cmp162 = icmp eq i32 %conv155, %conv161
  br i1 %cmp162, label %if.end168, label %if.then164

if.then164:                                       ; preds = %lor.lhs.false151
  %150 = load i32* %idx, align 4
  %call165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 8, i32 %150)
  %call166 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %151 = load i32* %m, align 4
  %152 = load i32* %x_u, align 4
  %153 = load i32* %y_u, align 4
  %154 = load i32* %z_u, align 4
  %155 = load i32* %x_s, align 4
  %156 = load i32* %y_s, align 4
  %157 = load i32* %z_s, align 4
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %151, i32 %152, i32 %153, i32 %154, i32 %155, i32 %156, i32 %157)
  store i32 1, i32* %retval
  br label %return

if.end168:                                        ; preds = %lor.lhs.false151, %lor.lhs.false144, %lor.lhs.false137, %lor.lhs.false134, %if.end128
  %158 = load i32* %z_u, align 4
  %conv169 = zext i32 %158 to i64
  %159 = load i32* %m, align 4
  %conv170 = zext i32 %159 to i64
  %call171 = call i64 @gcd(i64 %conv169, i64 %conv170)
  %cmp172 = icmp ne i64 %call171, 1
  br i1 %cmp172, label %if.end208, label %lor.lhs.false174

lor.lhs.false174:                                 ; preds = %if.end168
  %160 = load i32* %z_u, align 4
  %cmp175 = icmp eq i32 %160, 0
  br i1 %cmp175, label %if.end208, label %lor.lhs.false177

lor.lhs.false177:                                 ; preds = %lor.lhs.false174
  %161 = load i32* %x_s, align 4
  %conv178 = sext i32 %161 to i64
  %162 = load i32* %z_u, align 4
  %conv179 = zext i32 %162 to i64
  %call180 = call i64 @gcd(i64 %conv178, i64 %conv179)
  %163 = load i32* %z_u, align 4
  %conv181 = zext i32 %163 to i64
  %cmp182 = icmp ne i64 %call180, %conv181
  br i1 %cmp182, label %if.end208, label %lor.lhs.false184

lor.lhs.false184:                                 ; preds = %lor.lhs.false177
  %164 = load i32* %y_s, align 4
  %conv185 = sext i32 %164 to i64
  %165 = load i32* %z_u, align 4
  %conv186 = zext i32 %165 to i64
  %call187 = call i64 @gcd(i64 %conv185, i64 %conv186)
  %166 = load i32* %z_u, align 4
  %conv188 = zext i32 %166 to i64
  %cmp189 = icmp ne i64 %call187, %conv188
  br i1 %cmp189, label %if.end208, label %lor.lhs.false191

lor.lhs.false191:                                 ; preds = %lor.lhs.false184
  %167 = load i32* %x_s, align 4
  %168 = load i32* %m, align 4
  %rem192 = urem i32 %167, %168
  %169 = load i32* %y_s, align 4
  %170 = load i32* %m, align 4
  %rem193 = urem i32 %169, %170
  %cmp194 = icmp eq i32 %rem192, %rem193
  %conv195 = zext i1 %cmp194 to i32
  %171 = load i32* %x_s, align 4
  %172 = load i32* %z_u, align 4
  %div196 = udiv i32 %171, %172
  %173 = load i32* %m, align 4
  %rem197 = urem i32 %div196, %173
  %174 = load i32* %y_s, align 4
  %175 = load i32* %z_u, align 4
  %div198 = udiv i32 %174, %175
  %176 = load i32* %m, align 4
  %rem199 = urem i32 %div198, %176
  %cmp200 = icmp eq i32 %rem197, %rem199
  %conv201 = zext i1 %cmp200 to i32
  %cmp202 = icmp eq i32 %conv195, %conv201
  br i1 %cmp202, label %if.end208, label %if.then204

if.then204:                                       ; preds = %lor.lhs.false191
  %177 = load i32* %idx, align 4
  %call205 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 9, i32 %177)
  %call206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %178 = load i32* %m, align 4
  %179 = load i32* %x_u, align 4
  %180 = load i32* %y_u, align 4
  %181 = load i32* %z_u, align 4
  %182 = load i32* %x_s, align 4
  %183 = load i32* %y_s, align 4
  %184 = load i32* %z_s, align 4
  %call207 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %178, i32 %179, i32 %180, i32 %181, i32 %182, i32 %183, i32 %184)
  store i32 1, i32* %retval
  br label %return

if.end208:                                        ; preds = %lor.lhs.false191, %lor.lhs.false184, %lor.lhs.false177, %lor.lhs.false174, %if.end168
  %185 = load i32* %z_s, align 4
  %conv209 = sext i32 %185 to i64
  %186 = load i32* %m, align 4
  %conv210 = zext i32 %186 to i64
  %call211 = call i64 @gcd(i64 %conv209, i64 %conv210)
  %cmp212 = icmp ne i64 %call211, 1
  br i1 %cmp212, label %if.end248, label %lor.lhs.false214

lor.lhs.false214:                                 ; preds = %if.end208
  %187 = load i32* %z_s, align 4
  %cmp215 = icmp eq i32 %187, 0
  br i1 %cmp215, label %if.end248, label %lor.lhs.false217

lor.lhs.false217:                                 ; preds = %lor.lhs.false214
  %188 = load i32* %x_s, align 4
  %conv218 = sext i32 %188 to i64
  %189 = load i32* %z_s, align 4
  %conv219 = sext i32 %189 to i64
  %call220 = call i64 @gcd(i64 %conv218, i64 %conv219)
  %190 = load i32* %z_s, align 4
  %conv221 = sext i32 %190 to i64
  %cmp222 = icmp ne i64 %call220, %conv221
  br i1 %cmp222, label %if.end248, label %lor.lhs.false224

lor.lhs.false224:                                 ; preds = %lor.lhs.false217
  %191 = load i32* %y_u, align 4
  %conv225 = zext i32 %191 to i64
  %192 = load i32* %z_s, align 4
  %conv226 = sext i32 %192 to i64
  %call227 = call i64 @gcd(i64 %conv225, i64 %conv226)
  %193 = load i32* %z_s, align 4
  %conv228 = sext i32 %193 to i64
  %cmp229 = icmp ne i64 %call227, %conv228
  br i1 %cmp229, label %if.end248, label %lor.lhs.false231

lor.lhs.false231:                                 ; preds = %lor.lhs.false224
  %194 = load i32* %x_s, align 4
  %195 = load i32* %m, align 4
  %rem232 = urem i32 %194, %195
  %196 = load i32* %y_u, align 4
  %197 = load i32* %m, align 4
  %rem233 = urem i32 %196, %197
  %cmp234 = icmp eq i32 %rem232, %rem233
  %conv235 = zext i1 %cmp234 to i32
  %198 = load i32* %x_s, align 4
  %199 = load i32* %z_s, align 4
  %div236 = sdiv i32 %198, %199
  %200 = load i32* %m, align 4
  %rem237 = urem i32 %div236, %200
  %201 = load i32* %y_u, align 4
  %202 = load i32* %z_s, align 4
  %div238 = udiv i32 %201, %202
  %203 = load i32* %m, align 4
  %rem239 = urem i32 %div238, %203
  %cmp240 = icmp eq i32 %rem237, %rem239
  %conv241 = zext i1 %cmp240 to i32
  %cmp242 = icmp eq i32 %conv235, %conv241
  br i1 %cmp242, label %if.end248, label %if.then244

if.then244:                                       ; preds = %lor.lhs.false231
  %204 = load i32* %idx, align 4
  %call245 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 10, i32 %204)
  %call246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %205 = load i32* %m, align 4
  %206 = load i32* %x_u, align 4
  %207 = load i32* %y_u, align 4
  %208 = load i32* %z_u, align 4
  %209 = load i32* %x_s, align 4
  %210 = load i32* %y_s, align 4
  %211 = load i32* %z_s, align 4
  %call247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %205, i32 %206, i32 %207, i32 %208, i32 %209, i32 %210, i32 %211)
  store i32 1, i32* %retval
  br label %return

if.end248:                                        ; preds = %lor.lhs.false231, %lor.lhs.false224, %lor.lhs.false217, %lor.lhs.false214, %if.end208
  %212 = load i32* %z_u, align 4
  %conv249 = zext i32 %212 to i64
  %213 = load i32* %m, align 4
  %conv250 = zext i32 %213 to i64
  %call251 = call i64 @gcd(i64 %conv249, i64 %conv250)
  %cmp252 = icmp ne i64 %call251, 1
  br i1 %cmp252, label %if.end288, label %lor.lhs.false254

lor.lhs.false254:                                 ; preds = %if.end248
  %214 = load i32* %z_u, align 4
  %cmp255 = icmp eq i32 %214, 0
  br i1 %cmp255, label %if.end288, label %lor.lhs.false257

lor.lhs.false257:                                 ; preds = %lor.lhs.false254
  %215 = load i32* %x_s, align 4
  %conv258 = sext i32 %215 to i64
  %216 = load i32* %z_u, align 4
  %conv259 = zext i32 %216 to i64
  %call260 = call i64 @gcd(i64 %conv258, i64 %conv259)
  %217 = load i32* %z_u, align 4
  %conv261 = zext i32 %217 to i64
  %cmp262 = icmp ne i64 %call260, %conv261
  br i1 %cmp262, label %if.end288, label %lor.lhs.false264

lor.lhs.false264:                                 ; preds = %lor.lhs.false257
  %218 = load i32* %y_u, align 4
  %conv265 = zext i32 %218 to i64
  %219 = load i32* %z_u, align 4
  %conv266 = zext i32 %219 to i64
  %call267 = call i64 @gcd(i64 %conv265, i64 %conv266)
  %220 = load i32* %z_u, align 4
  %conv268 = zext i32 %220 to i64
  %cmp269 = icmp ne i64 %call267, %conv268
  br i1 %cmp269, label %if.end288, label %lor.lhs.false271

lor.lhs.false271:                                 ; preds = %lor.lhs.false264
  %221 = load i32* %x_s, align 4
  %222 = load i32* %m, align 4
  %rem272 = urem i32 %221, %222
  %223 = load i32* %y_u, align 4
  %224 = load i32* %m, align 4
  %rem273 = urem i32 %223, %224
  %cmp274 = icmp eq i32 %rem272, %rem273
  %conv275 = zext i1 %cmp274 to i32
  %225 = load i32* %x_s, align 4
  %226 = load i32* %z_u, align 4
  %div276 = udiv i32 %225, %226
  %227 = load i32* %m, align 4
  %rem277 = urem i32 %div276, %227
  %228 = load i32* %y_u, align 4
  %229 = load i32* %z_u, align 4
  %div278 = udiv i32 %228, %229
  %230 = load i32* %m, align 4
  %rem279 = urem i32 %div278, %230
  %cmp280 = icmp eq i32 %rem277, %rem279
  %conv281 = zext i1 %cmp280 to i32
  %cmp282 = icmp eq i32 %conv275, %conv281
  br i1 %cmp282, label %if.end288, label %if.then284

if.then284:                                       ; preds = %lor.lhs.false271
  %231 = load i32* %idx, align 4
  %call285 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 11, i32 %231)
  %call286 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %232 = load i32* %m, align 4
  %233 = load i32* %x_u, align 4
  %234 = load i32* %y_u, align 4
  %235 = load i32* %z_u, align 4
  %236 = load i32* %x_s, align 4
  %237 = load i32* %y_s, align 4
  %238 = load i32* %z_s, align 4
  %call287 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %232, i32 %233, i32 %234, i32 %235, i32 %236, i32 %237, i32 %238)
  store i32 1, i32* %retval
  br label %return

if.end288:                                        ; preds = %lor.lhs.false271, %lor.lhs.false264, %lor.lhs.false257, %lor.lhs.false254, %if.end248
  %239 = load i32* %z_s, align 4
  %conv289 = sext i32 %239 to i64
  %240 = load i32* %m, align 4
  %conv290 = zext i32 %240 to i64
  %call291 = call i64 @gcd(i64 %conv289, i64 %conv290)
  %cmp292 = icmp ne i64 %call291, 1
  br i1 %cmp292, label %if.end328, label %lor.lhs.false294

lor.lhs.false294:                                 ; preds = %if.end288
  %241 = load i32* %z_s, align 4
  %cmp295 = icmp eq i32 %241, 0
  br i1 %cmp295, label %if.end328, label %lor.lhs.false297

lor.lhs.false297:                                 ; preds = %lor.lhs.false294
  %242 = load i32* %x_u, align 4
  %conv298 = zext i32 %242 to i64
  %243 = load i32* %z_s, align 4
  %conv299 = sext i32 %243 to i64
  %call300 = call i64 @gcd(i64 %conv298, i64 %conv299)
  %244 = load i32* %z_s, align 4
  %conv301 = sext i32 %244 to i64
  %cmp302 = icmp ne i64 %call300, %conv301
  br i1 %cmp302, label %if.end328, label %lor.lhs.false304

lor.lhs.false304:                                 ; preds = %lor.lhs.false297
  %245 = load i32* %y_s, align 4
  %conv305 = sext i32 %245 to i64
  %246 = load i32* %z_s, align 4
  %conv306 = sext i32 %246 to i64
  %call307 = call i64 @gcd(i64 %conv305, i64 %conv306)
  %247 = load i32* %z_s, align 4
  %conv308 = sext i32 %247 to i64
  %cmp309 = icmp ne i64 %call307, %conv308
  br i1 %cmp309, label %if.end328, label %lor.lhs.false311

lor.lhs.false311:                                 ; preds = %lor.lhs.false304
  %248 = load i32* %x_u, align 4
  %249 = load i32* %m, align 4
  %rem312 = urem i32 %248, %249
  %250 = load i32* %y_s, align 4
  %251 = load i32* %m, align 4
  %rem313 = urem i32 %250, %251
  %cmp314 = icmp eq i32 %rem312, %rem313
  %conv315 = zext i1 %cmp314 to i32
  %252 = load i32* %x_u, align 4
  %253 = load i32* %z_s, align 4
  %div316 = udiv i32 %252, %253
  %254 = load i32* %m, align 4
  %rem317 = urem i32 %div316, %254
  %255 = load i32* %y_s, align 4
  %256 = load i32* %z_s, align 4
  %div318 = sdiv i32 %255, %256
  %257 = load i32* %m, align 4
  %rem319 = urem i32 %div318, %257
  %cmp320 = icmp eq i32 %rem317, %rem319
  %conv321 = zext i1 %cmp320 to i32
  %cmp322 = icmp eq i32 %conv315, %conv321
  br i1 %cmp322, label %if.end328, label %if.then324

if.then324:                                       ; preds = %lor.lhs.false311
  %258 = load i32* %idx, align 4
  %call325 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 12, i32 %258)
  %call326 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %259 = load i32* %m, align 4
  %260 = load i32* %x_u, align 4
  %261 = load i32* %y_u, align 4
  %262 = load i32* %z_u, align 4
  %263 = load i32* %x_s, align 4
  %264 = load i32* %y_s, align 4
  %265 = load i32* %z_s, align 4
  %call327 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %259, i32 %260, i32 %261, i32 %262, i32 %263, i32 %264, i32 %265)
  store i32 1, i32* %retval
  br label %return

if.end328:                                        ; preds = %lor.lhs.false311, %lor.lhs.false304, %lor.lhs.false297, %lor.lhs.false294, %if.end288
  %266 = load i32* %z_u, align 4
  %conv329 = zext i32 %266 to i64
  %267 = load i32* %m, align 4
  %conv330 = zext i32 %267 to i64
  %call331 = call i64 @gcd(i64 %conv329, i64 %conv330)
  %cmp332 = icmp ne i64 %call331, 1
  br i1 %cmp332, label %if.end368, label %lor.lhs.false334

lor.lhs.false334:                                 ; preds = %if.end328
  %268 = load i32* %z_u, align 4
  %cmp335 = icmp eq i32 %268, 0
  br i1 %cmp335, label %if.end368, label %lor.lhs.false337

lor.lhs.false337:                                 ; preds = %lor.lhs.false334
  %269 = load i32* %x_u, align 4
  %conv338 = zext i32 %269 to i64
  %270 = load i32* %z_u, align 4
  %conv339 = zext i32 %270 to i64
  %call340 = call i64 @gcd(i64 %conv338, i64 %conv339)
  %271 = load i32* %z_u, align 4
  %conv341 = zext i32 %271 to i64
  %cmp342 = icmp ne i64 %call340, %conv341
  br i1 %cmp342, label %if.end368, label %lor.lhs.false344

lor.lhs.false344:                                 ; preds = %lor.lhs.false337
  %272 = load i32* %y_s, align 4
  %conv345 = sext i32 %272 to i64
  %273 = load i32* %z_u, align 4
  %conv346 = zext i32 %273 to i64
  %call347 = call i64 @gcd(i64 %conv345, i64 %conv346)
  %274 = load i32* %z_u, align 4
  %conv348 = zext i32 %274 to i64
  %cmp349 = icmp ne i64 %call347, %conv348
  br i1 %cmp349, label %if.end368, label %lor.lhs.false351

lor.lhs.false351:                                 ; preds = %lor.lhs.false344
  %275 = load i32* %x_u, align 4
  %276 = load i32* %m, align 4
  %rem352 = urem i32 %275, %276
  %277 = load i32* %y_s, align 4
  %278 = load i32* %m, align 4
  %rem353 = urem i32 %277, %278
  %cmp354 = icmp eq i32 %rem352, %rem353
  %conv355 = zext i1 %cmp354 to i32
  %279 = load i32* %x_u, align 4
  %280 = load i32* %z_u, align 4
  %div356 = udiv i32 %279, %280
  %281 = load i32* %m, align 4
  %rem357 = urem i32 %div356, %281
  %282 = load i32* %y_s, align 4
  %283 = load i32* %z_u, align 4
  %div358 = udiv i32 %282, %283
  %284 = load i32* %m, align 4
  %rem359 = urem i32 %div358, %284
  %cmp360 = icmp eq i32 %rem357, %rem359
  %conv361 = zext i1 %cmp360 to i32
  %cmp362 = icmp eq i32 %conv355, %conv361
  br i1 %cmp362, label %if.end368, label %if.then364

if.then364:                                       ; preds = %lor.lhs.false351
  %285 = load i32* %idx, align 4
  %call365 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 13, i32 %285)
  %call366 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %286 = load i32* %m, align 4
  %287 = load i32* %x_u, align 4
  %288 = load i32* %y_u, align 4
  %289 = load i32* %z_u, align 4
  %290 = load i32* %x_s, align 4
  %291 = load i32* %y_s, align 4
  %292 = load i32* %z_s, align 4
  %call367 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %286, i32 %287, i32 %288, i32 %289, i32 %290, i32 %291, i32 %292)
  store i32 1, i32* %retval
  br label %return

if.end368:                                        ; preds = %lor.lhs.false351, %lor.lhs.false344, %lor.lhs.false337, %lor.lhs.false334, %if.end328
  %293 = load i32* %z_s, align 4
  %conv369 = sext i32 %293 to i64
  %294 = load i32* %m, align 4
  %conv370 = zext i32 %294 to i64
  %call371 = call i64 @gcd(i64 %conv369, i64 %conv370)
  %cmp372 = icmp ne i64 %call371, 1
  br i1 %cmp372, label %if.end408, label %lor.lhs.false374

lor.lhs.false374:                                 ; preds = %if.end368
  %295 = load i32* %z_s, align 4
  %cmp375 = icmp eq i32 %295, 0
  br i1 %cmp375, label %if.end408, label %lor.lhs.false377

lor.lhs.false377:                                 ; preds = %lor.lhs.false374
  %296 = load i32* %x_u, align 4
  %conv378 = zext i32 %296 to i64
  %297 = load i32* %z_s, align 4
  %conv379 = sext i32 %297 to i64
  %call380 = call i64 @gcd(i64 %conv378, i64 %conv379)
  %298 = load i32* %z_s, align 4
  %conv381 = sext i32 %298 to i64
  %cmp382 = icmp ne i64 %call380, %conv381
  br i1 %cmp382, label %if.end408, label %lor.lhs.false384

lor.lhs.false384:                                 ; preds = %lor.lhs.false377
  %299 = load i32* %y_u, align 4
  %conv385 = zext i32 %299 to i64
  %300 = load i32* %z_s, align 4
  %conv386 = sext i32 %300 to i64
  %call387 = call i64 @gcd(i64 %conv385, i64 %conv386)
  %301 = load i32* %z_s, align 4
  %conv388 = sext i32 %301 to i64
  %cmp389 = icmp ne i64 %call387, %conv388
  br i1 %cmp389, label %if.end408, label %lor.lhs.false391

lor.lhs.false391:                                 ; preds = %lor.lhs.false384
  %302 = load i32* %x_u, align 4
  %303 = load i32* %m, align 4
  %rem392 = urem i32 %302, %303
  %304 = load i32* %y_u, align 4
  %305 = load i32* %m, align 4
  %rem393 = urem i32 %304, %305
  %cmp394 = icmp eq i32 %rem392, %rem393
  %conv395 = zext i1 %cmp394 to i32
  %306 = load i32* %x_u, align 4
  %307 = load i32* %z_s, align 4
  %div396 = udiv i32 %306, %307
  %308 = load i32* %m, align 4
  %rem397 = urem i32 %div396, %308
  %309 = load i32* %y_u, align 4
  %310 = load i32* %z_s, align 4
  %div398 = udiv i32 %309, %310
  %311 = load i32* %m, align 4
  %rem399 = urem i32 %div398, %311
  %cmp400 = icmp eq i32 %rem397, %rem399
  %conv401 = zext i1 %cmp400 to i32
  %cmp402 = icmp eq i32 %conv395, %conv401
  br i1 %cmp402, label %if.end408, label %if.then404

if.then404:                                       ; preds = %lor.lhs.false391
  %312 = load i32* %idx, align 4
  %call405 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 14, i32 %312)
  %call406 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %313 = load i32* %m, align 4
  %314 = load i32* %x_u, align 4
  %315 = load i32* %y_u, align 4
  %316 = load i32* %z_u, align 4
  %317 = load i32* %x_s, align 4
  %318 = load i32* %y_s, align 4
  %319 = load i32* %z_s, align 4
  %call407 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %313, i32 %314, i32 %315, i32 %316, i32 %317, i32 %318, i32 %319)
  store i32 1, i32* %retval
  br label %return

if.end408:                                        ; preds = %lor.lhs.false391, %lor.lhs.false384, %lor.lhs.false377, %lor.lhs.false374, %if.end368
  %320 = load i32* %z_u, align 4
  %conv409 = zext i32 %320 to i64
  %321 = load i32* %m, align 4
  %conv410 = zext i32 %321 to i64
  %call411 = call i64 @gcd(i64 %conv409, i64 %conv410)
  %cmp412 = icmp ne i64 %call411, 1
  br i1 %cmp412, label %if.end448, label %lor.lhs.false414

lor.lhs.false414:                                 ; preds = %if.end408
  %322 = load i32* %z_u, align 4
  %cmp415 = icmp eq i32 %322, 0
  br i1 %cmp415, label %if.end448, label %lor.lhs.false417

lor.lhs.false417:                                 ; preds = %lor.lhs.false414
  %323 = load i32* %x_u, align 4
  %conv418 = zext i32 %323 to i64
  %324 = load i32* %z_u, align 4
  %conv419 = zext i32 %324 to i64
  %call420 = call i64 @gcd(i64 %conv418, i64 %conv419)
  %325 = load i32* %z_u, align 4
  %conv421 = zext i32 %325 to i64
  %cmp422 = icmp ne i64 %call420, %conv421
  br i1 %cmp422, label %if.end448, label %lor.lhs.false424

lor.lhs.false424:                                 ; preds = %lor.lhs.false417
  %326 = load i32* %y_u, align 4
  %conv425 = zext i32 %326 to i64
  %327 = load i32* %z_u, align 4
  %conv426 = zext i32 %327 to i64
  %call427 = call i64 @gcd(i64 %conv425, i64 %conv426)
  %328 = load i32* %z_u, align 4
  %conv428 = zext i32 %328 to i64
  %cmp429 = icmp ne i64 %call427, %conv428
  br i1 %cmp429, label %if.end448, label %lor.lhs.false431

lor.lhs.false431:                                 ; preds = %lor.lhs.false424
  %329 = load i32* %x_u, align 4
  %330 = load i32* %m, align 4
  %rem432 = urem i32 %329, %330
  %331 = load i32* %y_u, align 4
  %332 = load i32* %m, align 4
  %rem433 = urem i32 %331, %332
  %cmp434 = icmp eq i32 %rem432, %rem433
  %conv435 = zext i1 %cmp434 to i32
  %333 = load i32* %x_u, align 4
  %334 = load i32* %z_u, align 4
  %div436 = udiv i32 %333, %334
  %335 = load i32* %m, align 4
  %rem437 = urem i32 %div436, %335
  %336 = load i32* %y_u, align 4
  %337 = load i32* %z_u, align 4
  %div438 = udiv i32 %336, %337
  %338 = load i32* %m, align 4
  %rem439 = urem i32 %div438, %338
  %cmp440 = icmp eq i32 %rem437, %rem439
  %conv441 = zext i1 %cmp440 to i32
  %cmp442 = icmp eq i32 %conv435, %conv441
  br i1 %cmp442, label %if.end448, label %if.then444

if.then444:                                       ; preds = %lor.lhs.false431
  %339 = load i32* %idx, align 4
  %call445 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 15, i32 %339)
  %call446 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %340 = load i32* %m, align 4
  %341 = load i32* %x_u, align 4
  %342 = load i32* %y_u, align 4
  %343 = load i32* %z_u, align 4
  %344 = load i32* %x_s, align 4
  %345 = load i32* %y_s, align 4
  %346 = load i32* %z_s, align 4
  %call447 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %340, i32 %341, i32 %342, i32 %343, i32 %344, i32 %345, i32 %346)
  store i32 1, i32* %retval
  br label %return

if.end448:                                        ; preds = %lor.lhs.false431, %lor.lhs.false424, %lor.lhs.false417, %lor.lhs.false414, %if.end408
  %347 = load i32* %z_s, align 4
  %cmp449 = icmp eq i32 %347, 0
  br i1 %cmp449, label %if.end491, label %lor.lhs.false451

lor.lhs.false451:                                 ; preds = %if.end448
  %348 = load i32* %x_s, align 4
  %conv452 = sext i32 %348 to i64
  %349 = load i32* %z_s, align 4
  %conv453 = sext i32 %349 to i64
  %call454 = call i64 @gcd(i64 %conv452, i64 %conv453)
  %350 = load i32* %z_s, align 4
  %conv455 = sext i32 %350 to i64
  %cmp456 = icmp ne i64 %call454, %conv455
  br i1 %cmp456, label %if.end491, label %lor.lhs.false458

lor.lhs.false458:                                 ; preds = %lor.lhs.false451
  %351 = load i32* %y_s, align 4
  %conv459 = sext i32 %351 to i64
  %352 = load i32* %z_s, align 4
  %conv460 = sext i32 %352 to i64
  %call461 = call i64 @gcd(i64 %conv459, i64 %conv460)
  %353 = load i32* %z_s, align 4
  %conv462 = sext i32 %353 to i64
  %cmp463 = icmp ne i64 %call461, %conv462
  br i1 %cmp463, label %if.end491, label %lor.lhs.false465

lor.lhs.false465:                                 ; preds = %lor.lhs.false458
  %354 = load i32* %m, align 4
  %conv466 = zext i32 %354 to i64
  %355 = load i32* %z_s, align 4
  %conv467 = sext i32 %355 to i64
  %call468 = call i64 @gcd(i64 %conv466, i64 %conv467)
  %356 = load i32* %z_s, align 4
  %conv469 = sext i32 %356 to i64
  %cmp470 = icmp ne i64 %call468, %conv469
  br i1 %cmp470, label %if.end491, label %lor.lhs.false472

lor.lhs.false472:                                 ; preds = %lor.lhs.false465
  %357 = load i32* %x_s, align 4
  %358 = load i32* %m, align 4
  %rem473 = urem i32 %357, %358
  %359 = load i32* %y_s, align 4
  %360 = load i32* %m, align 4
  %rem474 = urem i32 %359, %360
  %cmp475 = icmp eq i32 %rem473, %rem474
  %conv476 = zext i1 %cmp475 to i32
  %361 = load i32* %x_s, align 4
  %362 = load i32* %z_s, align 4
  %div477 = sdiv i32 %361, %362
  %363 = load i32* %m, align 4
  %364 = load i32* %z_s, align 4
  %div478 = udiv i32 %363, %364
  %rem479 = urem i32 %div477, %div478
  %365 = load i32* %y_s, align 4
  %366 = load i32* %z_s, align 4
  %div480 = sdiv i32 %365, %366
  %367 = load i32* %m, align 4
  %368 = load i32* %z_s, align 4
  %div481 = udiv i32 %367, %368
  %rem482 = urem i32 %div480, %div481
  %cmp483 = icmp eq i32 %rem479, %rem482
  %conv484 = zext i1 %cmp483 to i32
  %cmp485 = icmp eq i32 %conv476, %conv484
  br i1 %cmp485, label %if.end491, label %if.then487

if.then487:                                       ; preds = %lor.lhs.false472
  %369 = load i32* %idx, align 4
  %call488 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 16, i32 %369)
  %call489 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %370 = load i32* %m, align 4
  %371 = load i32* %x_u, align 4
  %372 = load i32* %y_u, align 4
  %373 = load i32* %z_u, align 4
  %374 = load i32* %x_s, align 4
  %375 = load i32* %y_s, align 4
  %376 = load i32* %z_s, align 4
  %call490 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %370, i32 %371, i32 %372, i32 %373, i32 %374, i32 %375, i32 %376)
  store i32 1, i32* %retval
  br label %return

if.end491:                                        ; preds = %lor.lhs.false472, %lor.lhs.false465, %lor.lhs.false458, %lor.lhs.false451, %if.end448
  %377 = load i32* %z_u, align 4
  %cmp492 = icmp eq i32 %377, 0
  br i1 %cmp492, label %if.end534, label %lor.lhs.false494

lor.lhs.false494:                                 ; preds = %if.end491
  %378 = load i32* %x_s, align 4
  %conv495 = sext i32 %378 to i64
  %379 = load i32* %z_u, align 4
  %conv496 = zext i32 %379 to i64
  %call497 = call i64 @gcd(i64 %conv495, i64 %conv496)
  %380 = load i32* %z_u, align 4
  %conv498 = zext i32 %380 to i64
  %cmp499 = icmp ne i64 %call497, %conv498
  br i1 %cmp499, label %if.end534, label %lor.lhs.false501

lor.lhs.false501:                                 ; preds = %lor.lhs.false494
  %381 = load i32* %y_s, align 4
  %conv502 = sext i32 %381 to i64
  %382 = load i32* %z_u, align 4
  %conv503 = zext i32 %382 to i64
  %call504 = call i64 @gcd(i64 %conv502, i64 %conv503)
  %383 = load i32* %z_u, align 4
  %conv505 = zext i32 %383 to i64
  %cmp506 = icmp ne i64 %call504, %conv505
  br i1 %cmp506, label %if.end534, label %lor.lhs.false508

lor.lhs.false508:                                 ; preds = %lor.lhs.false501
  %384 = load i32* %m, align 4
  %conv509 = zext i32 %384 to i64
  %385 = load i32* %z_u, align 4
  %conv510 = zext i32 %385 to i64
  %call511 = call i64 @gcd(i64 %conv509, i64 %conv510)
  %386 = load i32* %z_u, align 4
  %conv512 = zext i32 %386 to i64
  %cmp513 = icmp ne i64 %call511, %conv512
  br i1 %cmp513, label %if.end534, label %lor.lhs.false515

lor.lhs.false515:                                 ; preds = %lor.lhs.false508
  %387 = load i32* %x_s, align 4
  %388 = load i32* %m, align 4
  %rem516 = urem i32 %387, %388
  %389 = load i32* %y_s, align 4
  %390 = load i32* %m, align 4
  %rem517 = urem i32 %389, %390
  %cmp518 = icmp eq i32 %rem516, %rem517
  %conv519 = zext i1 %cmp518 to i32
  %391 = load i32* %x_s, align 4
  %392 = load i32* %z_u, align 4
  %div520 = udiv i32 %391, %392
  %393 = load i32* %m, align 4
  %394 = load i32* %z_u, align 4
  %div521 = udiv i32 %393, %394
  %rem522 = urem i32 %div520, %div521
  %395 = load i32* %y_s, align 4
  %396 = load i32* %z_u, align 4
  %div523 = udiv i32 %395, %396
  %397 = load i32* %m, align 4
  %398 = load i32* %z_u, align 4
  %div524 = udiv i32 %397, %398
  %rem525 = urem i32 %div523, %div524
  %cmp526 = icmp eq i32 %rem522, %rem525
  %conv527 = zext i1 %cmp526 to i32
  %cmp528 = icmp eq i32 %conv519, %conv527
  br i1 %cmp528, label %if.end534, label %if.then530

if.then530:                                       ; preds = %lor.lhs.false515
  %399 = load i32* %idx, align 4
  %call531 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 17, i32 %399)
  %call532 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %400 = load i32* %m, align 4
  %401 = load i32* %x_u, align 4
  %402 = load i32* %y_u, align 4
  %403 = load i32* %z_u, align 4
  %404 = load i32* %x_s, align 4
  %405 = load i32* %y_s, align 4
  %406 = load i32* %z_s, align 4
  %call533 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %400, i32 %401, i32 %402, i32 %403, i32 %404, i32 %405, i32 %406)
  store i32 1, i32* %retval
  br label %return

if.end534:                                        ; preds = %lor.lhs.false515, %lor.lhs.false508, %lor.lhs.false501, %lor.lhs.false494, %if.end491
  %407 = load i32* %z_s, align 4
  %cmp535 = icmp eq i32 %407, 0
  br i1 %cmp535, label %if.end577, label %lor.lhs.false537

lor.lhs.false537:                                 ; preds = %if.end534
  %408 = load i32* %x_s, align 4
  %conv538 = sext i32 %408 to i64
  %409 = load i32* %z_s, align 4
  %conv539 = sext i32 %409 to i64
  %call540 = call i64 @gcd(i64 %conv538, i64 %conv539)
  %410 = load i32* %z_s, align 4
  %conv541 = sext i32 %410 to i64
  %cmp542 = icmp ne i64 %call540, %conv541
  br i1 %cmp542, label %if.end577, label %lor.lhs.false544

lor.lhs.false544:                                 ; preds = %lor.lhs.false537
  %411 = load i32* %y_u, align 4
  %conv545 = zext i32 %411 to i64
  %412 = load i32* %z_s, align 4
  %conv546 = sext i32 %412 to i64
  %call547 = call i64 @gcd(i64 %conv545, i64 %conv546)
  %413 = load i32* %z_s, align 4
  %conv548 = sext i32 %413 to i64
  %cmp549 = icmp ne i64 %call547, %conv548
  br i1 %cmp549, label %if.end577, label %lor.lhs.false551

lor.lhs.false551:                                 ; preds = %lor.lhs.false544
  %414 = load i32* %m, align 4
  %conv552 = zext i32 %414 to i64
  %415 = load i32* %z_s, align 4
  %conv553 = sext i32 %415 to i64
  %call554 = call i64 @gcd(i64 %conv552, i64 %conv553)
  %416 = load i32* %z_s, align 4
  %conv555 = sext i32 %416 to i64
  %cmp556 = icmp ne i64 %call554, %conv555
  br i1 %cmp556, label %if.end577, label %lor.lhs.false558

lor.lhs.false558:                                 ; preds = %lor.lhs.false551
  %417 = load i32* %x_s, align 4
  %418 = load i32* %m, align 4
  %rem559 = urem i32 %417, %418
  %419 = load i32* %y_u, align 4
  %420 = load i32* %m, align 4
  %rem560 = urem i32 %419, %420
  %cmp561 = icmp eq i32 %rem559, %rem560
  %conv562 = zext i1 %cmp561 to i32
  %421 = load i32* %x_s, align 4
  %422 = load i32* %z_s, align 4
  %div563 = sdiv i32 %421, %422
  %423 = load i32* %m, align 4
  %424 = load i32* %z_s, align 4
  %div564 = udiv i32 %423, %424
  %rem565 = urem i32 %div563, %div564
  %425 = load i32* %y_u, align 4
  %426 = load i32* %z_s, align 4
  %div566 = udiv i32 %425, %426
  %427 = load i32* %m, align 4
  %428 = load i32* %z_s, align 4
  %div567 = udiv i32 %427, %428
  %rem568 = urem i32 %div566, %div567
  %cmp569 = icmp eq i32 %rem565, %rem568
  %conv570 = zext i1 %cmp569 to i32
  %cmp571 = icmp eq i32 %conv562, %conv570
  br i1 %cmp571, label %if.end577, label %if.then573

if.then573:                                       ; preds = %lor.lhs.false558
  %429 = load i32* %idx, align 4
  %call574 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 18, i32 %429)
  %call575 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %430 = load i32* %m, align 4
  %431 = load i32* %x_u, align 4
  %432 = load i32* %y_u, align 4
  %433 = load i32* %z_u, align 4
  %434 = load i32* %x_s, align 4
  %435 = load i32* %y_s, align 4
  %436 = load i32* %z_s, align 4
  %call576 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %430, i32 %431, i32 %432, i32 %433, i32 %434, i32 %435, i32 %436)
  store i32 1, i32* %retval
  br label %return

if.end577:                                        ; preds = %lor.lhs.false558, %lor.lhs.false551, %lor.lhs.false544, %lor.lhs.false537, %if.end534
  %437 = load i32* %z_u, align 4
  %cmp578 = icmp eq i32 %437, 0
  br i1 %cmp578, label %if.end620, label %lor.lhs.false580

lor.lhs.false580:                                 ; preds = %if.end577
  %438 = load i32* %x_s, align 4
  %conv581 = sext i32 %438 to i64
  %439 = load i32* %z_u, align 4
  %conv582 = zext i32 %439 to i64
  %call583 = call i64 @gcd(i64 %conv581, i64 %conv582)
  %440 = load i32* %z_u, align 4
  %conv584 = zext i32 %440 to i64
  %cmp585 = icmp ne i64 %call583, %conv584
  br i1 %cmp585, label %if.end620, label %lor.lhs.false587

lor.lhs.false587:                                 ; preds = %lor.lhs.false580
  %441 = load i32* %y_u, align 4
  %conv588 = zext i32 %441 to i64
  %442 = load i32* %z_u, align 4
  %conv589 = zext i32 %442 to i64
  %call590 = call i64 @gcd(i64 %conv588, i64 %conv589)
  %443 = load i32* %z_u, align 4
  %conv591 = zext i32 %443 to i64
  %cmp592 = icmp ne i64 %call590, %conv591
  br i1 %cmp592, label %if.end620, label %lor.lhs.false594

lor.lhs.false594:                                 ; preds = %lor.lhs.false587
  %444 = load i32* %m, align 4
  %conv595 = zext i32 %444 to i64
  %445 = load i32* %z_u, align 4
  %conv596 = zext i32 %445 to i64
  %call597 = call i64 @gcd(i64 %conv595, i64 %conv596)
  %446 = load i32* %z_u, align 4
  %conv598 = zext i32 %446 to i64
  %cmp599 = icmp ne i64 %call597, %conv598
  br i1 %cmp599, label %if.end620, label %lor.lhs.false601

lor.lhs.false601:                                 ; preds = %lor.lhs.false594
  %447 = load i32* %x_s, align 4
  %448 = load i32* %m, align 4
  %rem602 = urem i32 %447, %448
  %449 = load i32* %y_u, align 4
  %450 = load i32* %m, align 4
  %rem603 = urem i32 %449, %450
  %cmp604 = icmp eq i32 %rem602, %rem603
  %conv605 = zext i1 %cmp604 to i32
  %451 = load i32* %x_s, align 4
  %452 = load i32* %z_u, align 4
  %div606 = udiv i32 %451, %452
  %453 = load i32* %m, align 4
  %454 = load i32* %z_u, align 4
  %div607 = udiv i32 %453, %454
  %rem608 = urem i32 %div606, %div607
  %455 = load i32* %y_u, align 4
  %456 = load i32* %z_u, align 4
  %div609 = udiv i32 %455, %456
  %457 = load i32* %m, align 4
  %458 = load i32* %z_u, align 4
  %div610 = udiv i32 %457, %458
  %rem611 = urem i32 %div609, %div610
  %cmp612 = icmp eq i32 %rem608, %rem611
  %conv613 = zext i1 %cmp612 to i32
  %cmp614 = icmp eq i32 %conv605, %conv613
  br i1 %cmp614, label %if.end620, label %if.then616

if.then616:                                       ; preds = %lor.lhs.false601
  %459 = load i32* %idx, align 4
  %call617 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 19, i32 %459)
  %call618 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %460 = load i32* %m, align 4
  %461 = load i32* %x_u, align 4
  %462 = load i32* %y_u, align 4
  %463 = load i32* %z_u, align 4
  %464 = load i32* %x_s, align 4
  %465 = load i32* %y_s, align 4
  %466 = load i32* %z_s, align 4
  %call619 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %460, i32 %461, i32 %462, i32 %463, i32 %464, i32 %465, i32 %466)
  store i32 1, i32* %retval
  br label %return

if.end620:                                        ; preds = %lor.lhs.false601, %lor.lhs.false594, %lor.lhs.false587, %lor.lhs.false580, %if.end577
  %467 = load i32* %z_s, align 4
  %cmp621 = icmp eq i32 %467, 0
  br i1 %cmp621, label %if.end663, label %lor.lhs.false623

lor.lhs.false623:                                 ; preds = %if.end620
  %468 = load i32* %x_u, align 4
  %conv624 = zext i32 %468 to i64
  %469 = load i32* %z_s, align 4
  %conv625 = sext i32 %469 to i64
  %call626 = call i64 @gcd(i64 %conv624, i64 %conv625)
  %470 = load i32* %z_s, align 4
  %conv627 = sext i32 %470 to i64
  %cmp628 = icmp ne i64 %call626, %conv627
  br i1 %cmp628, label %if.end663, label %lor.lhs.false630

lor.lhs.false630:                                 ; preds = %lor.lhs.false623
  %471 = load i32* %y_s, align 4
  %conv631 = sext i32 %471 to i64
  %472 = load i32* %z_s, align 4
  %conv632 = sext i32 %472 to i64
  %call633 = call i64 @gcd(i64 %conv631, i64 %conv632)
  %473 = load i32* %z_s, align 4
  %conv634 = sext i32 %473 to i64
  %cmp635 = icmp ne i64 %call633, %conv634
  br i1 %cmp635, label %if.end663, label %lor.lhs.false637

lor.lhs.false637:                                 ; preds = %lor.lhs.false630
  %474 = load i32* %m, align 4
  %conv638 = zext i32 %474 to i64
  %475 = load i32* %z_s, align 4
  %conv639 = sext i32 %475 to i64
  %call640 = call i64 @gcd(i64 %conv638, i64 %conv639)
  %476 = load i32* %z_s, align 4
  %conv641 = sext i32 %476 to i64
  %cmp642 = icmp ne i64 %call640, %conv641
  br i1 %cmp642, label %if.end663, label %lor.lhs.false644

lor.lhs.false644:                                 ; preds = %lor.lhs.false637
  %477 = load i32* %x_u, align 4
  %478 = load i32* %m, align 4
  %rem645 = urem i32 %477, %478
  %479 = load i32* %y_s, align 4
  %480 = load i32* %m, align 4
  %rem646 = urem i32 %479, %480
  %cmp647 = icmp eq i32 %rem645, %rem646
  %conv648 = zext i1 %cmp647 to i32
  %481 = load i32* %x_u, align 4
  %482 = load i32* %z_s, align 4
  %div649 = udiv i32 %481, %482
  %483 = load i32* %m, align 4
  %484 = load i32* %z_s, align 4
  %div650 = udiv i32 %483, %484
  %rem651 = urem i32 %div649, %div650
  %485 = load i32* %y_s, align 4
  %486 = load i32* %z_s, align 4
  %div652 = sdiv i32 %485, %486
  %487 = load i32* %m, align 4
  %488 = load i32* %z_s, align 4
  %div653 = udiv i32 %487, %488
  %rem654 = urem i32 %div652, %div653
  %cmp655 = icmp eq i32 %rem651, %rem654
  %conv656 = zext i1 %cmp655 to i32
  %cmp657 = icmp eq i32 %conv648, %conv656
  br i1 %cmp657, label %if.end663, label %if.then659

if.then659:                                       ; preds = %lor.lhs.false644
  %489 = load i32* %idx, align 4
  %call660 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 20, i32 %489)
  %call661 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %490 = load i32* %m, align 4
  %491 = load i32* %x_u, align 4
  %492 = load i32* %y_u, align 4
  %493 = load i32* %z_u, align 4
  %494 = load i32* %x_s, align 4
  %495 = load i32* %y_s, align 4
  %496 = load i32* %z_s, align 4
  %call662 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %490, i32 %491, i32 %492, i32 %493, i32 %494, i32 %495, i32 %496)
  store i32 1, i32* %retval
  br label %return

if.end663:                                        ; preds = %lor.lhs.false644, %lor.lhs.false637, %lor.lhs.false630, %lor.lhs.false623, %if.end620
  %497 = load i32* %z_u, align 4
  %cmp664 = icmp eq i32 %497, 0
  br i1 %cmp664, label %if.end706, label %lor.lhs.false666

lor.lhs.false666:                                 ; preds = %if.end663
  %498 = load i32* %x_u, align 4
  %conv667 = zext i32 %498 to i64
  %499 = load i32* %z_u, align 4
  %conv668 = zext i32 %499 to i64
  %call669 = call i64 @gcd(i64 %conv667, i64 %conv668)
  %500 = load i32* %z_u, align 4
  %conv670 = zext i32 %500 to i64
  %cmp671 = icmp ne i64 %call669, %conv670
  br i1 %cmp671, label %if.end706, label %lor.lhs.false673

lor.lhs.false673:                                 ; preds = %lor.lhs.false666
  %501 = load i32* %y_s, align 4
  %conv674 = sext i32 %501 to i64
  %502 = load i32* %z_u, align 4
  %conv675 = zext i32 %502 to i64
  %call676 = call i64 @gcd(i64 %conv674, i64 %conv675)
  %503 = load i32* %z_u, align 4
  %conv677 = zext i32 %503 to i64
  %cmp678 = icmp ne i64 %call676, %conv677
  br i1 %cmp678, label %if.end706, label %lor.lhs.false680

lor.lhs.false680:                                 ; preds = %lor.lhs.false673
  %504 = load i32* %m, align 4
  %conv681 = zext i32 %504 to i64
  %505 = load i32* %z_u, align 4
  %conv682 = zext i32 %505 to i64
  %call683 = call i64 @gcd(i64 %conv681, i64 %conv682)
  %506 = load i32* %z_u, align 4
  %conv684 = zext i32 %506 to i64
  %cmp685 = icmp ne i64 %call683, %conv684
  br i1 %cmp685, label %if.end706, label %lor.lhs.false687

lor.lhs.false687:                                 ; preds = %lor.lhs.false680
  %507 = load i32* %x_u, align 4
  %508 = load i32* %m, align 4
  %rem688 = urem i32 %507, %508
  %509 = load i32* %y_s, align 4
  %510 = load i32* %m, align 4
  %rem689 = urem i32 %509, %510
  %cmp690 = icmp eq i32 %rem688, %rem689
  %conv691 = zext i1 %cmp690 to i32
  %511 = load i32* %x_u, align 4
  %512 = load i32* %z_u, align 4
  %div692 = udiv i32 %511, %512
  %513 = load i32* %m, align 4
  %514 = load i32* %z_u, align 4
  %div693 = udiv i32 %513, %514
  %rem694 = urem i32 %div692, %div693
  %515 = load i32* %y_s, align 4
  %516 = load i32* %z_u, align 4
  %div695 = udiv i32 %515, %516
  %517 = load i32* %m, align 4
  %518 = load i32* %z_u, align 4
  %div696 = udiv i32 %517, %518
  %rem697 = urem i32 %div695, %div696
  %cmp698 = icmp eq i32 %rem694, %rem697
  %conv699 = zext i1 %cmp698 to i32
  %cmp700 = icmp eq i32 %conv691, %conv699
  br i1 %cmp700, label %if.end706, label %if.then702

if.then702:                                       ; preds = %lor.lhs.false687
  %519 = load i32* %idx, align 4
  %call703 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 21, i32 %519)
  %call704 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %520 = load i32* %m, align 4
  %521 = load i32* %x_u, align 4
  %522 = load i32* %y_u, align 4
  %523 = load i32* %z_u, align 4
  %524 = load i32* %x_s, align 4
  %525 = load i32* %y_s, align 4
  %526 = load i32* %z_s, align 4
  %call705 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %520, i32 %521, i32 %522, i32 %523, i32 %524, i32 %525, i32 %526)
  store i32 1, i32* %retval
  br label %return

if.end706:                                        ; preds = %lor.lhs.false687, %lor.lhs.false680, %lor.lhs.false673, %lor.lhs.false666, %if.end663
  %527 = load i32* %z_s, align 4
  %cmp707 = icmp eq i32 %527, 0
  br i1 %cmp707, label %if.end749, label %lor.lhs.false709

lor.lhs.false709:                                 ; preds = %if.end706
  %528 = load i32* %x_u, align 4
  %conv710 = zext i32 %528 to i64
  %529 = load i32* %z_s, align 4
  %conv711 = sext i32 %529 to i64
  %call712 = call i64 @gcd(i64 %conv710, i64 %conv711)
  %530 = load i32* %z_s, align 4
  %conv713 = sext i32 %530 to i64
  %cmp714 = icmp ne i64 %call712, %conv713
  br i1 %cmp714, label %if.end749, label %lor.lhs.false716

lor.lhs.false716:                                 ; preds = %lor.lhs.false709
  %531 = load i32* %y_u, align 4
  %conv717 = zext i32 %531 to i64
  %532 = load i32* %z_s, align 4
  %conv718 = sext i32 %532 to i64
  %call719 = call i64 @gcd(i64 %conv717, i64 %conv718)
  %533 = load i32* %z_s, align 4
  %conv720 = sext i32 %533 to i64
  %cmp721 = icmp ne i64 %call719, %conv720
  br i1 %cmp721, label %if.end749, label %lor.lhs.false723

lor.lhs.false723:                                 ; preds = %lor.lhs.false716
  %534 = load i32* %m, align 4
  %conv724 = zext i32 %534 to i64
  %535 = load i32* %z_s, align 4
  %conv725 = sext i32 %535 to i64
  %call726 = call i64 @gcd(i64 %conv724, i64 %conv725)
  %536 = load i32* %z_s, align 4
  %conv727 = sext i32 %536 to i64
  %cmp728 = icmp ne i64 %call726, %conv727
  br i1 %cmp728, label %if.end749, label %lor.lhs.false730

lor.lhs.false730:                                 ; preds = %lor.lhs.false723
  %537 = load i32* %x_u, align 4
  %538 = load i32* %m, align 4
  %rem731 = urem i32 %537, %538
  %539 = load i32* %y_u, align 4
  %540 = load i32* %m, align 4
  %rem732 = urem i32 %539, %540
  %cmp733 = icmp eq i32 %rem731, %rem732
  %conv734 = zext i1 %cmp733 to i32
  %541 = load i32* %x_u, align 4
  %542 = load i32* %z_s, align 4
  %div735 = udiv i32 %541, %542
  %543 = load i32* %m, align 4
  %544 = load i32* %z_s, align 4
  %div736 = udiv i32 %543, %544
  %rem737 = urem i32 %div735, %div736
  %545 = load i32* %y_u, align 4
  %546 = load i32* %z_s, align 4
  %div738 = udiv i32 %545, %546
  %547 = load i32* %m, align 4
  %548 = load i32* %z_s, align 4
  %div739 = udiv i32 %547, %548
  %rem740 = urem i32 %div738, %div739
  %cmp741 = icmp eq i32 %rem737, %rem740
  %conv742 = zext i1 %cmp741 to i32
  %cmp743 = icmp eq i32 %conv734, %conv742
  br i1 %cmp743, label %if.end749, label %if.then745

if.then745:                                       ; preds = %lor.lhs.false730
  %549 = load i32* %idx, align 4
  %call746 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 22, i32 %549)
  %call747 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %550 = load i32* %m, align 4
  %551 = load i32* %x_u, align 4
  %552 = load i32* %y_u, align 4
  %553 = load i32* %z_u, align 4
  %554 = load i32* %x_s, align 4
  %555 = load i32* %y_s, align 4
  %556 = load i32* %z_s, align 4
  %call748 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %550, i32 %551, i32 %552, i32 %553, i32 %554, i32 %555, i32 %556)
  store i32 1, i32* %retval
  br label %return

if.end749:                                        ; preds = %lor.lhs.false730, %lor.lhs.false723, %lor.lhs.false716, %lor.lhs.false709, %if.end706
  %557 = load i32* %z_u, align 4
  %cmp750 = icmp eq i32 %557, 0
  br i1 %cmp750, label %if.end792, label %lor.lhs.false752

lor.lhs.false752:                                 ; preds = %if.end749
  %558 = load i32* %x_u, align 4
  %conv753 = zext i32 %558 to i64
  %559 = load i32* %z_u, align 4
  %conv754 = zext i32 %559 to i64
  %call755 = call i64 @gcd(i64 %conv753, i64 %conv754)
  %560 = load i32* %z_u, align 4
  %conv756 = zext i32 %560 to i64
  %cmp757 = icmp ne i64 %call755, %conv756
  br i1 %cmp757, label %if.end792, label %lor.lhs.false759

lor.lhs.false759:                                 ; preds = %lor.lhs.false752
  %561 = load i32* %y_u, align 4
  %conv760 = zext i32 %561 to i64
  %562 = load i32* %z_u, align 4
  %conv761 = zext i32 %562 to i64
  %call762 = call i64 @gcd(i64 %conv760, i64 %conv761)
  %563 = load i32* %z_u, align 4
  %conv763 = zext i32 %563 to i64
  %cmp764 = icmp ne i64 %call762, %conv763
  br i1 %cmp764, label %if.end792, label %lor.lhs.false766

lor.lhs.false766:                                 ; preds = %lor.lhs.false759
  %564 = load i32* %m, align 4
  %conv767 = zext i32 %564 to i64
  %565 = load i32* %z_u, align 4
  %conv768 = zext i32 %565 to i64
  %call769 = call i64 @gcd(i64 %conv767, i64 %conv768)
  %566 = load i32* %z_u, align 4
  %conv770 = zext i32 %566 to i64
  %cmp771 = icmp ne i64 %call769, %conv770
  br i1 %cmp771, label %if.end792, label %lor.lhs.false773

lor.lhs.false773:                                 ; preds = %lor.lhs.false766
  %567 = load i32* %x_u, align 4
  %568 = load i32* %m, align 4
  %rem774 = urem i32 %567, %568
  %569 = load i32* %y_u, align 4
  %570 = load i32* %m, align 4
  %rem775 = urem i32 %569, %570
  %cmp776 = icmp eq i32 %rem774, %rem775
  %conv777 = zext i1 %cmp776 to i32
  %571 = load i32* %x_u, align 4
  %572 = load i32* %z_u, align 4
  %div778 = udiv i32 %571, %572
  %573 = load i32* %m, align 4
  %574 = load i32* %z_u, align 4
  %div779 = udiv i32 %573, %574
  %rem780 = urem i32 %div778, %div779
  %575 = load i32* %y_u, align 4
  %576 = load i32* %z_u, align 4
  %div781 = udiv i32 %575, %576
  %577 = load i32* %m, align 4
  %578 = load i32* %z_u, align 4
  %div782 = udiv i32 %577, %578
  %rem783 = urem i32 %div781, %div782
  %cmp784 = icmp eq i32 %rem780, %rem783
  %conv785 = zext i1 %cmp784 to i32
  %cmp786 = icmp eq i32 %conv777, %conv785
  br i1 %cmp786, label %if.end792, label %if.then788

if.then788:                                       ; preds = %lor.lhs.false773
  %579 = load i32* %idx, align 4
  %call789 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 23, i32 %579)
  %call790 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %580 = load i32* %m, align 4
  %581 = load i32* %x_u, align 4
  %582 = load i32* %y_u, align 4
  %583 = load i32* %z_u, align 4
  %584 = load i32* %x_s, align 4
  %585 = load i32* %y_s, align 4
  %586 = load i32* %z_s, align 4
  %call791 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %580, i32 %581, i32 %582, i32 %583, i32 %584, i32 %585, i32 %586)
  store i32 1, i32* %retval
  br label %return

if.end792:                                        ; preds = %lor.lhs.false773, %lor.lhs.false766, %lor.lhs.false759, %lor.lhs.false752, %if.end749
  %587 = load i32* %z_u, align 4
  %cmp793 = icmp eq i32 %587, 0
  br i1 %cmp793, label %if.end817, label %lor.lhs.false795

lor.lhs.false795:                                 ; preds = %if.end792
  %588 = load i32* %m, align 4
  %conv796 = zext i32 %588 to i64
  %589 = load i32* %z_u, align 4
  %conv797 = zext i32 %589 to i64
  %call798 = call i64 @gcd(i64 %conv796, i64 %conv797)
  %590 = load i32* %z_u, align 4
  %conv799 = zext i32 %590 to i64
  %cmp800 = icmp ne i64 %call798, %conv799
  br i1 %cmp800, label %if.end817, label %lor.lhs.false802

lor.lhs.false802:                                 ; preds = %lor.lhs.false795
  %591 = load i32* %x_s, align 4
  %592 = load i32* %m, align 4
  %rem803 = urem i32 %591, %592
  %593 = load i32* %y_s, align 4
  %594 = load i32* %m, align 4
  %rem804 = urem i32 %593, %594
  %cmp805 = icmp eq i32 %rem803, %rem804
  %conv806 = zext i1 %cmp805 to i32
  %595 = load i32* %x_s, align 4
  %596 = load i32* %z_u, align 4
  %rem807 = urem i32 %595, %596
  %597 = load i32* %y_s, align 4
  %598 = load i32* %z_u, align 4
  %rem808 = urem i32 %597, %598
  %cmp809 = icmp eq i32 %rem807, %rem808
  %conv810 = zext i1 %cmp809 to i32
  %cmp811 = icmp eq i32 %conv806, %conv810
  br i1 %cmp811, label %if.end817, label %if.then813

if.then813:                                       ; preds = %lor.lhs.false802
  %599 = load i32* %idx, align 4
  %call814 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 25, i32 %599)
  %call815 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %600 = load i32* %m, align 4
  %601 = load i32* %x_u, align 4
  %602 = load i32* %y_u, align 4
  %603 = load i32* %z_u, align 4
  %604 = load i32* %x_s, align 4
  %605 = load i32* %y_s, align 4
  %606 = load i32* %z_s, align 4
  %call816 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %600, i32 %601, i32 %602, i32 %603, i32 %604, i32 %605, i32 %606)
  store i32 1, i32* %retval
  br label %return

if.end817:                                        ; preds = %lor.lhs.false802, %lor.lhs.false795, %if.end792
  %607 = load i32* %z_u, align 4
  %cmp818 = icmp eq i32 %607, 0
  br i1 %cmp818, label %if.end842, label %lor.lhs.false820

lor.lhs.false820:                                 ; preds = %if.end817
  %608 = load i32* %m, align 4
  %conv821 = zext i32 %608 to i64
  %609 = load i32* %z_u, align 4
  %conv822 = zext i32 %609 to i64
  %call823 = call i64 @gcd(i64 %conv821, i64 %conv822)
  %610 = load i32* %z_u, align 4
  %conv824 = zext i32 %610 to i64
  %cmp825 = icmp ne i64 %call823, %conv824
  br i1 %cmp825, label %if.end842, label %lor.lhs.false827

lor.lhs.false827:                                 ; preds = %lor.lhs.false820
  %611 = load i32* %x_s, align 4
  %612 = load i32* %m, align 4
  %rem828 = urem i32 %611, %612
  %613 = load i32* %y_u, align 4
  %614 = load i32* %m, align 4
  %rem829 = urem i32 %613, %614
  %cmp830 = icmp eq i32 %rem828, %rem829
  %conv831 = zext i1 %cmp830 to i32
  %615 = load i32* %x_s, align 4
  %616 = load i32* %z_u, align 4
  %rem832 = urem i32 %615, %616
  %617 = load i32* %y_u, align 4
  %618 = load i32* %z_u, align 4
  %rem833 = urem i32 %617, %618
  %cmp834 = icmp eq i32 %rem832, %rem833
  %conv835 = zext i1 %cmp834 to i32
  %cmp836 = icmp eq i32 %conv831, %conv835
  br i1 %cmp836, label %if.end842, label %if.then838

if.then838:                                       ; preds = %lor.lhs.false827
  %619 = load i32* %idx, align 4
  %call839 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 27, i32 %619)
  %call840 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %620 = load i32* %m, align 4
  %621 = load i32* %x_u, align 4
  %622 = load i32* %y_u, align 4
  %623 = load i32* %z_u, align 4
  %624 = load i32* %x_s, align 4
  %625 = load i32* %y_s, align 4
  %626 = load i32* %z_s, align 4
  %call841 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %620, i32 %621, i32 %622, i32 %623, i32 %624, i32 %625, i32 %626)
  store i32 1, i32* %retval
  br label %return

if.end842:                                        ; preds = %lor.lhs.false827, %lor.lhs.false820, %if.end817
  %627 = load i32* %z_u, align 4
  %cmp843 = icmp eq i32 %627, 0
  br i1 %cmp843, label %if.end867, label %lor.lhs.false845

lor.lhs.false845:                                 ; preds = %if.end842
  %628 = load i32* %m, align 4
  %conv846 = zext i32 %628 to i64
  %629 = load i32* %z_u, align 4
  %conv847 = zext i32 %629 to i64
  %call848 = call i64 @gcd(i64 %conv846, i64 %conv847)
  %630 = load i32* %z_u, align 4
  %conv849 = zext i32 %630 to i64
  %cmp850 = icmp ne i64 %call848, %conv849
  br i1 %cmp850, label %if.end867, label %lor.lhs.false852

lor.lhs.false852:                                 ; preds = %lor.lhs.false845
  %631 = load i32* %x_u, align 4
  %632 = load i32* %m, align 4
  %rem853 = urem i32 %631, %632
  %633 = load i32* %y_s, align 4
  %634 = load i32* %m, align 4
  %rem854 = urem i32 %633, %634
  %cmp855 = icmp eq i32 %rem853, %rem854
  %conv856 = zext i1 %cmp855 to i32
  %635 = load i32* %x_u, align 4
  %636 = load i32* %z_u, align 4
  %rem857 = urem i32 %635, %636
  %637 = load i32* %y_s, align 4
  %638 = load i32* %z_u, align 4
  %rem858 = urem i32 %637, %638
  %cmp859 = icmp eq i32 %rem857, %rem858
  %conv860 = zext i1 %cmp859 to i32
  %cmp861 = icmp eq i32 %conv856, %conv860
  br i1 %cmp861, label %if.end867, label %if.then863

if.then863:                                       ; preds = %lor.lhs.false852
  %639 = load i32* %idx, align 4
  %call864 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 29, i32 %639)
  %call865 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %640 = load i32* %m, align 4
  %641 = load i32* %x_u, align 4
  %642 = load i32* %y_u, align 4
  %643 = load i32* %z_u, align 4
  %644 = load i32* %x_s, align 4
  %645 = load i32* %y_s, align 4
  %646 = load i32* %z_s, align 4
  %call866 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %640, i32 %641, i32 %642, i32 %643, i32 %644, i32 %645, i32 %646)
  store i32 1, i32* %retval
  br label %return

if.end867:                                        ; preds = %lor.lhs.false852, %lor.lhs.false845, %if.end842
  %647 = load i32* %z_u, align 4
  %cmp868 = icmp eq i32 %647, 0
  br i1 %cmp868, label %if.end892, label %lor.lhs.false870

lor.lhs.false870:                                 ; preds = %if.end867
  %648 = load i32* %m, align 4
  %conv871 = zext i32 %648 to i64
  %649 = load i32* %z_u, align 4
  %conv872 = zext i32 %649 to i64
  %call873 = call i64 @gcd(i64 %conv871, i64 %conv872)
  %650 = load i32* %z_u, align 4
  %conv874 = zext i32 %650 to i64
  %cmp875 = icmp ne i64 %call873, %conv874
  br i1 %cmp875, label %if.end892, label %lor.lhs.false877

lor.lhs.false877:                                 ; preds = %lor.lhs.false870
  %651 = load i32* %x_u, align 4
  %652 = load i32* %m, align 4
  %rem878 = urem i32 %651, %652
  %653 = load i32* %y_u, align 4
  %654 = load i32* %m, align 4
  %rem879 = urem i32 %653, %654
  %cmp880 = icmp eq i32 %rem878, %rem879
  %conv881 = zext i1 %cmp880 to i32
  %655 = load i32* %x_u, align 4
  %656 = load i32* %z_u, align 4
  %rem882 = urem i32 %655, %656
  %657 = load i32* %y_u, align 4
  %658 = load i32* %z_u, align 4
  %rem883 = urem i32 %657, %658
  %cmp884 = icmp eq i32 %rem882, %rem883
  %conv885 = zext i1 %cmp884 to i32
  %cmp886 = icmp eq i32 %conv881, %conv885
  br i1 %cmp886, label %if.end892, label %if.then888

if.then888:                                       ; preds = %lor.lhs.false877
  %659 = load i32* %idx, align 4
  %call889 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0), i32 31, i32 %659)
  %call890 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  %660 = load i32* %m, align 4
  %661 = load i32* %x_u, align 4
  %662 = load i32* %y_u, align 4
  %663 = load i32* %z_u, align 4
  %664 = load i32* %x_s, align 4
  %665 = load i32* %y_s, align 4
  %666 = load i32* %z_s, align 4
  %call891 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([54 x i8]* @.str2, i32 0, i32 0), i32 %660, i32 %661, i32 %662, i32 %663, i32 %664, i32 %665, i32 %666)
  store i32 1, i32* %retval
  br label %return

if.end892:                                        ; preds = %lor.lhs.false877, %lor.lhs.false870, %if.end867
  br label %for.inc

for.inc:                                          ; preds = %if.end892, %if.then
  %667 = load i32* %idx, align 4
  %inc = add i32 %667, 1
  store i32 %inc, i32* %idx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call893 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then888, %if.then863, %if.then838, %if.then813, %if.then788, %if.then745, %if.then702, %if.then659, %if.then616, %if.then573, %if.then530, %if.then487, %if.then444, %if.then404, %if.then364, %if.then324, %if.then284, %if.then244, %if.then204, %if.then164, %if.then124, %if.then105, %if.then82, %if.then62, %if.then52, %if.then42, %if.then32
  %668 = load i32* %retval
  ret i32 %668
}

declare i32 @rand() nounwind

declare i32 @printf(i8*, ...)
