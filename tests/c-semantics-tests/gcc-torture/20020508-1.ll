; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020508-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@uc = global i8 52, align 1
@us = global i16 -3532, align 2
@ui = global i32 62004, align 4
@ul = global i64 4063516280, align 8
@ull = global i64 1090791845765373680, align 8
@shift1 = global i32 4, align 4
@shift2 = global i32 60, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i8* @uc, align 1
  %conv = zext i8 %0 to i32
  %1 = load i32* @shift1, align 4
  %shr = ashr i32 %conv, %1
  %2 = load i8* @uc, align 1
  %conv1 = zext i8 %2 to i32
  %3 = load i32* @shift1, align 4
  %conv2 = sext i32 %3 to i64
  %sub = sub i64 8, %conv2
  %sh_prom = trunc i64 %sub to i32
  %shl = shl i32 %conv1, %sh_prom
  %or = or i32 %shr, %shl
  %cmp = icmp ne i32 %or, 835
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %4 = load i8* @uc, align 1
  %conv4 = zext i8 %4 to i32
  %shr5 = ashr i32 %conv4, 4
  %5 = load i8* @uc, align 1
  %conv6 = zext i8 %5 to i32
  %shl7 = shl i32 %conv6, 4
  %or8 = or i32 %shr5, %shl7
  %cmp9 = icmp ne i32 %or8, 835
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end
  %6 = load i16* @us, align 2
  %conv13 = zext i16 %6 to i32
  %7 = load i32* @shift1, align 4
  %shr14 = ashr i32 %conv13, %7
  %8 = load i16* @us, align 2
  %conv15 = zext i16 %8 to i32
  %9 = load i32* @shift1, align 4
  %conv16 = sext i32 %9 to i64
  %sub17 = sub i64 16, %conv16
  %sh_prom18 = trunc i64 %sub17 to i32
  %shl19 = shl i32 %conv15, %sh_prom18
  %or20 = or i32 %shr14, %shl19
  %cmp21 = icmp ne i32 %or20, 253972259
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end12
  %10 = load i16* @us, align 2
  %conv25 = zext i16 %10 to i32
  %shr26 = ashr i32 %conv25, 4
  %11 = load i16* @us, align 2
  %conv27 = zext i16 %11 to i32
  %shl28 = shl i32 %conv27, 12
  %or29 = or i32 %shr26, %shl28
  %cmp30 = icmp ne i32 %or29, 253972259
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end24
  %12 = load i32* @ui, align 4
  %13 = load i32* @shift1, align 4
  %shr34 = lshr i32 %12, %13
  %14 = load i32* @ui, align 4
  %15 = load i32* @shift1, align 4
  %conv35 = sext i32 %15 to i64
  %sub36 = sub i64 32, %conv35
  %sh_prom37 = trunc i64 %sub36 to i32
  %shl38 = shl i32 %14, %sh_prom37
  %or39 = or i32 %shr34, %shl38
  %cmp40 = icmp ne i32 %or39, 1073745699
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end33
  %16 = load i32* @ui, align 4
  %shr44 = lshr i32 %16, 4
  %17 = load i32* @ui, align 4
  %shl45 = shl i32 %17, 28
  %or46 = or i32 %shr44, %shl45
  %cmp47 = icmp ne i32 %or46, 1073745699
  br i1 %cmp47, label %if.then49, label %if.end50

if.then49:                                        ; preds = %if.end43
  call void @abort() noreturn nounwind
  unreachable

if.end50:                                         ; preds = %if.end43
  %18 = load i64* @ul, align 8
  %19 = load i32* @shift1, align 4
  %sh_prom51 = zext i32 %19 to i64
  %shr52 = lshr i64 %18, %sh_prom51
  %20 = load i64* @ul, align 8
  %21 = load i32* @shift1, align 4
  %conv53 = sext i32 %21 to i64
  %sub54 = sub i64 64, %conv53
  %shl55 = shl i64 %20, %sub54
  %or56 = or i64 %shr52, %shl55
  %cmp57 = icmp ne i64 %or56, -9223372036600806041
  br i1 %cmp57, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end50
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end50
  %22 = load i64* @ul, align 8
  %shr61 = lshr i64 %22, 4
  %23 = load i64* @ul, align 8
  %shl62 = shl i64 %23, 60
  %or63 = or i64 %shr61, %shl62
  %cmp64 = icmp ne i64 %or63, -9223372036600806041
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end67:                                         ; preds = %if.end60
  %24 = load i64* @ull, align 8
  %25 = load i32* @shift1, align 4
  %sh_prom68 = zext i32 %25 to i64
  %shr69 = lshr i64 %24, %sh_prom68
  %26 = load i64* @ull, align 8
  %27 = load i32* @shift1, align 4
  %conv70 = sext i32 %27 to i64
  %sub71 = sub i64 64, %conv70
  %shl72 = shl i64 %26, %sub71
  %or73 = or i64 %shr69, %shl72
  %cmp74 = icmp ne i64 %or73, 68174490360335855
  br i1 %cmp74, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.end67
  call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %if.end67
  %28 = load i64* @ull, align 8
  %shr78 = lshr i64 %28, 4
  %29 = load i64* @ull, align 8
  %shl79 = shl i64 %29, 60
  %or80 = or i64 %shr78, %shl79
  %cmp81 = icmp ne i64 %or80, 68174490360335855
  br i1 %cmp81, label %if.then83, label %if.end84

if.then83:                                        ; preds = %if.end77
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end77
  %30 = load i64* @ull, align 8
  %31 = load i32* @shift2, align 4
  %sh_prom85 = zext i32 %31 to i64
  %shr86 = lshr i64 %30, %sh_prom85
  %32 = load i64* @ull, align 8
  %33 = load i32* @shift2, align 4
  %conv87 = sext i32 %33 to i64
  %sub88 = sub i64 64, %conv87
  %shl89 = shl i64 %32, %sub88
  %or90 = or i64 %shr86, %shl89
  %cmp91 = icmp ne i64 %or90, -994074541463572736
  br i1 %cmp91, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end94:                                         ; preds = %if.end84
  %34 = load i64* @ull, align 8
  %shr95 = lshr i64 %34, 60
  %35 = load i64* @ull, align 8
  %shl96 = shl i64 %35, 4
  %or97 = or i64 %shr95, %shl96
  %cmp98 = icmp ne i64 %or97, -994074541463572736
  br i1 %cmp98, label %if.then100, label %if.end101

if.then100:                                       ; preds = %if.end94
  call void @abort() noreturn nounwind
  unreachable

if.end101:                                        ; preds = %if.end94
  %36 = load i8* @uc, align 1
  %conv102 = zext i8 %36 to i32
  %37 = load i32* @shift1, align 4
  %shl103 = shl i32 %conv102, %37
  %38 = load i8* @uc, align 1
  %conv104 = zext i8 %38 to i32
  %39 = load i32* @shift1, align 4
  %conv105 = sext i32 %39 to i64
  %sub106 = sub i64 8, %conv105
  %sh_prom107 = trunc i64 %sub106 to i32
  %shr108 = ashr i32 %conv104, %sh_prom107
  %or109 = or i32 %shl103, %shr108
  %cmp110 = icmp ne i32 %or109, 835
  br i1 %cmp110, label %if.then112, label %if.end113

if.then112:                                       ; preds = %if.end101
  call void @abort() noreturn nounwind
  unreachable

if.end113:                                        ; preds = %if.end101
  %40 = load i8* @uc, align 1
  %conv114 = zext i8 %40 to i32
  %shl115 = shl i32 %conv114, 4
  %41 = load i8* @uc, align 1
  %conv116 = zext i8 %41 to i32
  %shr117 = ashr i32 %conv116, 4
  %or118 = or i32 %shl115, %shr117
  %cmp119 = icmp ne i32 %or118, 835
  br i1 %cmp119, label %if.then121, label %if.end122

if.then121:                                       ; preds = %if.end113
  call void @abort() noreturn nounwind
  unreachable

if.end122:                                        ; preds = %if.end113
  %42 = load i16* @us, align 2
  %conv123 = zext i16 %42 to i32
  %43 = load i32* @shift1, align 4
  %shl124 = shl i32 %conv123, %43
  %44 = load i16* @us, align 2
  %conv125 = zext i16 %44 to i32
  %45 = load i32* @shift1, align 4
  %conv126 = sext i32 %45 to i64
  %sub127 = sub i64 16, %conv126
  %sh_prom128 = trunc i64 %sub127 to i32
  %shr129 = ashr i32 %conv125, %sh_prom128
  %or130 = or i32 %shl124, %shr129
  %cmp131 = icmp ne i32 %or130, 992079
  br i1 %cmp131, label %if.then133, label %if.end134

if.then133:                                       ; preds = %if.end122
  call void @abort() noreturn nounwind
  unreachable

if.end134:                                        ; preds = %if.end122
  %46 = load i16* @us, align 2
  %conv135 = zext i16 %46 to i32
  %shl136 = shl i32 %conv135, 4
  %47 = load i16* @us, align 2
  %conv137 = zext i16 %47 to i32
  %shr138 = ashr i32 %conv137, 12
  %or139 = or i32 %shl136, %shr138
  %cmp140 = icmp ne i32 %or139, 992079
  br i1 %cmp140, label %if.then142, label %if.end143

if.then142:                                       ; preds = %if.end134
  call void @abort() noreturn nounwind
  unreachable

if.end143:                                        ; preds = %if.end134
  %48 = load i32* @ui, align 4
  %49 = load i32* @shift1, align 4
  %shl144 = shl i32 %48, %49
  %50 = load i32* @ui, align 4
  %51 = load i32* @shift1, align 4
  %conv145 = sext i32 %51 to i64
  %sub146 = sub i64 32, %conv145
  %sh_prom147 = trunc i64 %sub146 to i32
  %shr148 = lshr i32 %50, %sh_prom147
  %or149 = or i32 %shl144, %shr148
  %cmp150 = icmp ne i32 %or149, 992064
  br i1 %cmp150, label %if.then152, label %if.end153

if.then152:                                       ; preds = %if.end143
  call void @abort() noreturn nounwind
  unreachable

if.end153:                                        ; preds = %if.end143
  %52 = load i32* @ui, align 4
  %shl154 = shl i32 %52, 4
  %53 = load i32* @ui, align 4
  %shr155 = lshr i32 %53, 28
  %or156 = or i32 %shl154, %shr155
  %cmp157 = icmp ne i32 %or156, 992064
  br i1 %cmp157, label %if.then159, label %if.end160

if.then159:                                       ; preds = %if.end153
  call void @abort() noreturn nounwind
  unreachable

if.end160:                                        ; preds = %if.end153
  %54 = load i64* @ul, align 8
  %55 = load i32* @shift1, align 4
  %sh_prom161 = zext i32 %55 to i64
  %shl162 = shl i64 %54, %sh_prom161
  %56 = load i64* @ul, align 8
  %57 = load i32* @shift1, align 4
  %conv163 = sext i32 %57 to i64
  %sub164 = sub i64 64, %conv163
  %shr165 = lshr i64 %56, %sub164
  %or166 = or i64 %shl162, %shr165
  %cmp167 = icmp ne i64 %or166, 65016260480
  br i1 %cmp167, label %if.then169, label %if.end170

if.then169:                                       ; preds = %if.end160
  call void @abort() noreturn nounwind
  unreachable

if.end170:                                        ; preds = %if.end160
  %58 = load i64* @ul, align 8
  %shl171 = shl i64 %58, 4
  %59 = load i64* @ul, align 8
  %shr172 = lshr i64 %59, 60
  %or173 = or i64 %shl171, %shr172
  %cmp174 = icmp ne i64 %or173, 65016260480
  br i1 %cmp174, label %if.then176, label %if.end177

if.then176:                                       ; preds = %if.end170
  call void @abort() noreturn nounwind
  unreachable

if.end177:                                        ; preds = %if.end170
  %60 = load i64* @ull, align 8
  %61 = load i32* @shift1, align 4
  %sh_prom178 = zext i32 %61 to i64
  %shl179 = shl i64 %60, %sh_prom178
  %62 = load i64* @ull, align 8
  %63 = load i32* @shift1, align 4
  %conv180 = sext i32 %63 to i64
  %sub181 = sub i64 64, %conv180
  %shr182 = lshr i64 %62, %sub181
  %or183 = or i64 %shl179, %shr182
  %cmp184 = icmp ne i64 %or183, -994074541463572736
  br i1 %cmp184, label %if.then186, label %if.end187

if.then186:                                       ; preds = %if.end177
  call void @abort() noreturn nounwind
  unreachable

if.end187:                                        ; preds = %if.end177
  %64 = load i64* @ull, align 8
  %shl188 = shl i64 %64, 4
  %65 = load i64* @ull, align 8
  %shr189 = lshr i64 %65, 60
  %or190 = or i64 %shl188, %shr189
  %cmp191 = icmp ne i64 %or190, -994074541463572736
  br i1 %cmp191, label %if.then193, label %if.end194

if.then193:                                       ; preds = %if.end187
  call void @abort() noreturn nounwind
  unreachable

if.end194:                                        ; preds = %if.end187
  %66 = load i64* @ull, align 8
  %67 = load i32* @shift2, align 4
  %sh_prom195 = zext i32 %67 to i64
  %shl196 = shl i64 %66, %sh_prom195
  %68 = load i64* @ull, align 8
  %69 = load i32* @shift2, align 4
  %conv197 = sext i32 %69 to i64
  %sub198 = sub i64 64, %conv197
  %shr199 = lshr i64 %68, %sub198
  %or200 = or i64 %shl196, %shr199
  %cmp201 = icmp ne i64 %or200, 68174490360335855
  br i1 %cmp201, label %if.then203, label %if.end204

if.then203:                                       ; preds = %if.end194
  call void @abort() noreturn nounwind
  unreachable

if.end204:                                        ; preds = %if.end194
  %70 = load i64* @ull, align 8
  %shl205 = shl i64 %70, 60
  %71 = load i64* @ull, align 8
  %shr206 = lshr i64 %71, 4
  %or207 = or i64 %shl205, %shr206
  %cmp208 = icmp ne i64 %or207, 68174490360335855
  br i1 %cmp208, label %if.then210, label %if.end211

if.then210:                                       ; preds = %if.end204
  call void @abort() noreturn nounwind
  unreachable

if.end211:                                        ; preds = %if.end204
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %72 = load i32* %retval
  ret i32 %72
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
