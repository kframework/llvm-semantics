; ModuleID = './20020508-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@uc = global i8 52, align 1
@us = global i16 -3532, align 2
@ui = global i32 62004, align 4
@ul = global i64 4063516280, align 8
@ull = global i64 1090791845765373680, align 8
@shift1 = global i32 4, align 4
@shift2 = global i32 60, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i8, i8* @uc, align 1
  %3 = zext i8 %2 to i32
  %4 = load i32, i32* @shift1, align 4
  %5 = ashr i32 %3, %4
  %6 = load i8, i8* @uc, align 1
  %7 = zext i8 %6 to i32
  %8 = load i32, i32* @shift1, align 4
  %9 = sext i32 %8 to i64
  %10 = sub i64 8, %9
  %11 = trunc i64 %10 to i32
  %12 = shl i32 %7, %11
  %13 = or i32 %5, %12
  %14 = icmp ne i32 %13, 835
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %0
  %17 = load i8, i8* @uc, align 1
  %18 = zext i8 %17 to i32
  %19 = ashr i32 %18, 4
  %20 = load i8, i8* @uc, align 1
  %21 = zext i8 %20 to i32
  %22 = shl i32 %21, 4
  %23 = or i32 %19, %22
  %24 = icmp ne i32 %23, 835
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %16
  %27 = load i16, i16* @us, align 2
  %28 = zext i16 %27 to i32
  %29 = load i32, i32* @shift1, align 4
  %30 = ashr i32 %28, %29
  %31 = load i16, i16* @us, align 2
  %32 = zext i16 %31 to i32
  %33 = load i32, i32* @shift1, align 4
  %34 = sext i32 %33 to i64
  %35 = sub i64 16, %34
  %36 = trunc i64 %35 to i32
  %37 = shl i32 %32, %36
  %38 = or i32 %30, %37
  %39 = icmp ne i32 %38, 253972259
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %26
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %26
  %42 = load i16, i16* @us, align 2
  %43 = zext i16 %42 to i32
  %44 = ashr i32 %43, 4
  %45 = load i16, i16* @us, align 2
  %46 = zext i16 %45 to i32
  %47 = shl i32 %46, 12
  %48 = or i32 %44, %47
  %49 = icmp ne i32 %48, 253972259
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:51                                      ; preds = %41
  %52 = load i32, i32* @ui, align 4
  %53 = load i32, i32* @shift1, align 4
  %54 = lshr i32 %52, %53
  %55 = load i32, i32* @ui, align 4
  %56 = load i32, i32* @shift1, align 4
  %57 = sext i32 %56 to i64
  %58 = sub i64 32, %57
  %59 = trunc i64 %58 to i32
  %60 = shl i32 %55, %59
  %61 = or i32 %54, %60
  %62 = icmp ne i32 %61, 1073745699
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %51
  call void @abort() #2
  unreachable

; <label>:64                                      ; preds = %51
  %65 = load i32, i32* @ui, align 4
  %66 = lshr i32 %65, 4
  %67 = load i32, i32* @ui, align 4
  %68 = shl i32 %67, 28
  %69 = or i32 %66, %68
  %70 = icmp ne i32 %69, 1073745699
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %64
  call void @abort() #2
  unreachable

; <label>:72                                      ; preds = %64
  %73 = load i64, i64* @ul, align 8
  %74 = load i32, i32* @shift1, align 4
  %75 = zext i32 %74 to i64
  %76 = lshr i64 %73, %75
  %77 = load i64, i64* @ul, align 8
  %78 = load i32, i32* @shift1, align 4
  %79 = sext i32 %78 to i64
  %80 = sub i64 64, %79
  %81 = shl i64 %77, %80
  %82 = or i64 %76, %81
  %83 = icmp ne i64 %82, -9223372036600806041
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %72
  call void @abort() #2
  unreachable

; <label>:85                                      ; preds = %72
  %86 = load i64, i64* @ul, align 8
  %87 = lshr i64 %86, 4
  %88 = load i64, i64* @ul, align 8
  %89 = shl i64 %88, 60
  %90 = or i64 %87, %89
  %91 = icmp ne i64 %90, -9223372036600806041
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %85
  call void @abort() #2
  unreachable

; <label>:93                                      ; preds = %85
  %94 = load i64, i64* @ull, align 8
  %95 = load i32, i32* @shift1, align 4
  %96 = zext i32 %95 to i64
  %97 = lshr i64 %94, %96
  %98 = load i64, i64* @ull, align 8
  %99 = load i32, i32* @shift1, align 4
  %100 = sext i32 %99 to i64
  %101 = sub i64 64, %100
  %102 = shl i64 %98, %101
  %103 = or i64 %97, %102
  %104 = icmp ne i64 %103, 68174490360335855
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %93
  call void @abort() #2
  unreachable

; <label>:106                                     ; preds = %93
  %107 = load i64, i64* @ull, align 8
  %108 = lshr i64 %107, 4
  %109 = load i64, i64* @ull, align 8
  %110 = shl i64 %109, 60
  %111 = or i64 %108, %110
  %112 = icmp ne i64 %111, 68174490360335855
  br i1 %112, label %113, label %114

; <label>:113                                     ; preds = %106
  call void @abort() #2
  unreachable

; <label>:114                                     ; preds = %106
  %115 = load i64, i64* @ull, align 8
  %116 = load i32, i32* @shift2, align 4
  %117 = zext i32 %116 to i64
  %118 = lshr i64 %115, %117
  %119 = load i64, i64* @ull, align 8
  %120 = load i32, i32* @shift2, align 4
  %121 = sext i32 %120 to i64
  %122 = sub i64 64, %121
  %123 = shl i64 %119, %122
  %124 = or i64 %118, %123
  %125 = icmp ne i64 %124, -994074541463572736
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %114
  call void @abort() #2
  unreachable

; <label>:127                                     ; preds = %114
  %128 = load i64, i64* @ull, align 8
  %129 = lshr i64 %128, 60
  %130 = load i64, i64* @ull, align 8
  %131 = shl i64 %130, 4
  %132 = or i64 %129, %131
  %133 = icmp ne i64 %132, -994074541463572736
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %127
  call void @abort() #2
  unreachable

; <label>:135                                     ; preds = %127
  %136 = load i8, i8* @uc, align 1
  %137 = zext i8 %136 to i32
  %138 = load i32, i32* @shift1, align 4
  %139 = shl i32 %137, %138
  %140 = load i8, i8* @uc, align 1
  %141 = zext i8 %140 to i32
  %142 = load i32, i32* @shift1, align 4
  %143 = sext i32 %142 to i64
  %144 = sub i64 8, %143
  %145 = trunc i64 %144 to i32
  %146 = ashr i32 %141, %145
  %147 = or i32 %139, %146
  %148 = icmp ne i32 %147, 835
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %135
  call void @abort() #2
  unreachable

; <label>:150                                     ; preds = %135
  %151 = load i8, i8* @uc, align 1
  %152 = zext i8 %151 to i32
  %153 = shl i32 %152, 4
  %154 = load i8, i8* @uc, align 1
  %155 = zext i8 %154 to i32
  %156 = ashr i32 %155, 4
  %157 = or i32 %153, %156
  %158 = icmp ne i32 %157, 835
  br i1 %158, label %159, label %160

; <label>:159                                     ; preds = %150
  call void @abort() #2
  unreachable

; <label>:160                                     ; preds = %150
  %161 = load i16, i16* @us, align 2
  %162 = zext i16 %161 to i32
  %163 = load i32, i32* @shift1, align 4
  %164 = shl i32 %162, %163
  %165 = load i16, i16* @us, align 2
  %166 = zext i16 %165 to i32
  %167 = load i32, i32* @shift1, align 4
  %168 = sext i32 %167 to i64
  %169 = sub i64 16, %168
  %170 = trunc i64 %169 to i32
  %171 = ashr i32 %166, %170
  %172 = or i32 %164, %171
  %173 = icmp ne i32 %172, 992079
  br i1 %173, label %174, label %175

; <label>:174                                     ; preds = %160
  call void @abort() #2
  unreachable

; <label>:175                                     ; preds = %160
  %176 = load i16, i16* @us, align 2
  %177 = zext i16 %176 to i32
  %178 = shl i32 %177, 4
  %179 = load i16, i16* @us, align 2
  %180 = zext i16 %179 to i32
  %181 = ashr i32 %180, 12
  %182 = or i32 %178, %181
  %183 = icmp ne i32 %182, 992079
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %175
  call void @abort() #2
  unreachable

; <label>:185                                     ; preds = %175
  %186 = load i32, i32* @ui, align 4
  %187 = load i32, i32* @shift1, align 4
  %188 = shl i32 %186, %187
  %189 = load i32, i32* @ui, align 4
  %190 = load i32, i32* @shift1, align 4
  %191 = sext i32 %190 to i64
  %192 = sub i64 32, %191
  %193 = trunc i64 %192 to i32
  %194 = lshr i32 %189, %193
  %195 = or i32 %188, %194
  %196 = icmp ne i32 %195, 992064
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %185
  call void @abort() #2
  unreachable

; <label>:198                                     ; preds = %185
  %199 = load i32, i32* @ui, align 4
  %200 = shl i32 %199, 4
  %201 = load i32, i32* @ui, align 4
  %202 = lshr i32 %201, 28
  %203 = or i32 %200, %202
  %204 = icmp ne i32 %203, 992064
  br i1 %204, label %205, label %206

; <label>:205                                     ; preds = %198
  call void @abort() #2
  unreachable

; <label>:206                                     ; preds = %198
  %207 = load i64, i64* @ul, align 8
  %208 = load i32, i32* @shift1, align 4
  %209 = zext i32 %208 to i64
  %210 = shl i64 %207, %209
  %211 = load i64, i64* @ul, align 8
  %212 = load i32, i32* @shift1, align 4
  %213 = sext i32 %212 to i64
  %214 = sub i64 64, %213
  %215 = lshr i64 %211, %214
  %216 = or i64 %210, %215
  %217 = icmp ne i64 %216, 65016260480
  br i1 %217, label %218, label %219

; <label>:218                                     ; preds = %206
  call void @abort() #2
  unreachable

; <label>:219                                     ; preds = %206
  %220 = load i64, i64* @ul, align 8
  %221 = shl i64 %220, 4
  %222 = load i64, i64* @ul, align 8
  %223 = lshr i64 %222, 60
  %224 = or i64 %221, %223
  %225 = icmp ne i64 %224, 65016260480
  br i1 %225, label %226, label %227

; <label>:226                                     ; preds = %219
  call void @abort() #2
  unreachable

; <label>:227                                     ; preds = %219
  %228 = load i64, i64* @ull, align 8
  %229 = load i32, i32* @shift1, align 4
  %230 = zext i32 %229 to i64
  %231 = shl i64 %228, %230
  %232 = load i64, i64* @ull, align 8
  %233 = load i32, i32* @shift1, align 4
  %234 = sext i32 %233 to i64
  %235 = sub i64 64, %234
  %236 = lshr i64 %232, %235
  %237 = or i64 %231, %236
  %238 = icmp ne i64 %237, -994074541463572736
  br i1 %238, label %239, label %240

; <label>:239                                     ; preds = %227
  call void @abort() #2
  unreachable

; <label>:240                                     ; preds = %227
  %241 = load i64, i64* @ull, align 8
  %242 = shl i64 %241, 4
  %243 = load i64, i64* @ull, align 8
  %244 = lshr i64 %243, 60
  %245 = or i64 %242, %244
  %246 = icmp ne i64 %245, -994074541463572736
  br i1 %246, label %247, label %248

; <label>:247                                     ; preds = %240
  call void @abort() #2
  unreachable

; <label>:248                                     ; preds = %240
  %249 = load i64, i64* @ull, align 8
  %250 = load i32, i32* @shift2, align 4
  %251 = zext i32 %250 to i64
  %252 = shl i64 %249, %251
  %253 = load i64, i64* @ull, align 8
  %254 = load i32, i32* @shift2, align 4
  %255 = sext i32 %254 to i64
  %256 = sub i64 64, %255
  %257 = lshr i64 %253, %256
  %258 = or i64 %252, %257
  %259 = icmp ne i64 %258, 68174490360335855
  br i1 %259, label %260, label %261

; <label>:260                                     ; preds = %248
  call void @abort() #2
  unreachable

; <label>:261                                     ; preds = %248
  %262 = load i64, i64* @ull, align 8
  %263 = shl i64 %262, 60
  %264 = load i64, i64* @ull, align 8
  %265 = lshr i64 %264, 4
  %266 = or i64 %263, %265
  %267 = icmp ne i64 %266, 68174490360335855
  br i1 %267, label %268, label %269

; <label>:268                                     ; preds = %261
  call void @abort() #2
  unreachable

; <label>:269                                     ; preds = %261
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %271 = load i32, i32* %1
  ret i32 %271
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
