; ModuleID = './divcmp-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp eq i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp ne i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp ne i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp slt i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp slt i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test7(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sle i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test8(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sle i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test9(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sgt i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test10(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sgt i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test11(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sge i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test12(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp sge i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test1(i32 -30)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @test1(i32 -29)
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @test1(i32 -20)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @test1(i32 -19)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @test2(i32 0)
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @test2(i32 9)
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @test2(i32 10)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @test2(i32 -1)
  %31 = icmp ne i32 %30, 1
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i32 @test2(i32 -9)
  %35 = icmp ne i32 %34, 1
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i32 @test2(i32 -10)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call i32 @test3(i32 -30)
  %43 = icmp ne i32 %42, 1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call i32 @test3(i32 -29)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %45
  %50 = call i32 @test3(i32 -20)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %49
  call void @abort() #2
  unreachable

; <label>:53                                      ; preds = %49
  %54 = call i32 @test3(i32 -19)
  %55 = icmp ne i32 %54, 1
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:57                                      ; preds = %53
  %58 = call i32 @test4(i32 0)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  call void @abort() #2
  unreachable

; <label>:61                                      ; preds = %57
  %62 = call i32 @test4(i32 9)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  call void @abort() #2
  unreachable

; <label>:65                                      ; preds = %61
  %66 = call i32 @test4(i32 10)
  %67 = icmp ne i32 %66, 1
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #2
  unreachable

; <label>:69                                      ; preds = %65
  %70 = call i32 @test4(i32 -1)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  call void @abort() #2
  unreachable

; <label>:73                                      ; preds = %69
  %74 = call i32 @test4(i32 -9)
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  call void @abort() #2
  unreachable

; <label>:77                                      ; preds = %73
  %78 = call i32 @test4(i32 -10)
  %79 = icmp ne i32 %78, 1
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  call void @abort() #2
  unreachable

; <label>:81                                      ; preds = %77
  %82 = call i32 @test5(i32 -30)
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %81
  call void @abort() #2
  unreachable

; <label>:85                                      ; preds = %81
  %86 = call i32 @test5(i32 -29)
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  call void @abort() #2
  unreachable

; <label>:89                                      ; preds = %85
  %90 = call i32 @test5(i32 -20)
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %89
  call void @abort() #2
  unreachable

; <label>:93                                      ; preds = %89
  %94 = call i32 @test5(i32 -19)
  %95 = icmp ne i32 %94, 1
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %93
  call void @abort() #2
  unreachable

; <label>:97                                      ; preds = %93
  %98 = call i32 @test6(i32 0)
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %101

; <label>:100                                     ; preds = %97
  call void @abort() #2
  unreachable

; <label>:101                                     ; preds = %97
  %102 = call i32 @test6(i32 9)
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %101
  call void @abort() #2
  unreachable

; <label>:105                                     ; preds = %101
  %106 = call i32 @test6(i32 10)
  %107 = icmp ne i32 %106, 1
  br i1 %107, label %108, label %109

; <label>:108                                     ; preds = %105
  call void @abort() #2
  unreachable

; <label>:109                                     ; preds = %105
  %110 = call i32 @test6(i32 -1)
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %109
  call void @abort() #2
  unreachable

; <label>:113                                     ; preds = %109
  %114 = call i32 @test6(i32 -9)
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %113
  call void @abort() #2
  unreachable

; <label>:117                                     ; preds = %113
  %118 = call i32 @test6(i32 -10)
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %117
  call void @abort() #2
  unreachable

; <label>:121                                     ; preds = %117
  %122 = call i32 @test7(i32 -30)
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %125

; <label>:124                                     ; preds = %121
  call void @abort() #2
  unreachable

; <label>:125                                     ; preds = %121
  %126 = call i32 @test7(i32 -29)
  %127 = icmp ne i32 %126, 1
  br i1 %127, label %128, label %129

; <label>:128                                     ; preds = %125
  call void @abort() #2
  unreachable

; <label>:129                                     ; preds = %125
  %130 = call i32 @test7(i32 -20)
  %131 = icmp ne i32 %130, 1
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %129
  call void @abort() #2
  unreachable

; <label>:133                                     ; preds = %129
  %134 = call i32 @test7(i32 -19)
  %135 = icmp ne i32 %134, 1
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %133
  call void @abort() #2
  unreachable

; <label>:137                                     ; preds = %133
  %138 = call i32 @test8(i32 0)
  %139 = icmp ne i32 %138, 1
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %137
  call void @abort() #2
  unreachable

; <label>:141                                     ; preds = %137
  %142 = call i32 @test8(i32 9)
  %143 = icmp ne i32 %142, 1
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %141
  call void @abort() #2
  unreachable

; <label>:145                                     ; preds = %141
  %146 = call i32 @test8(i32 10)
  %147 = icmp ne i32 %146, 1
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %145
  call void @abort() #2
  unreachable

; <label>:149                                     ; preds = %145
  %150 = call i32 @test8(i32 -1)
  %151 = icmp ne i32 %150, 1
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %149
  call void @abort() #2
  unreachable

; <label>:153                                     ; preds = %149
  %154 = call i32 @test8(i32 -9)
  %155 = icmp ne i32 %154, 1
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %153
  call void @abort() #2
  unreachable

; <label>:157                                     ; preds = %153
  %158 = call i32 @test8(i32 -10)
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %161

; <label>:160                                     ; preds = %157
  call void @abort() #2
  unreachable

; <label>:161                                     ; preds = %157
  %162 = call i32 @test9(i32 -30)
  %163 = icmp ne i32 %162, 1
  br i1 %163, label %164, label %165

; <label>:164                                     ; preds = %161
  call void @abort() #2
  unreachable

; <label>:165                                     ; preds = %161
  %166 = call i32 @test9(i32 -29)
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %165
  call void @abort() #2
  unreachable

; <label>:169                                     ; preds = %165
  %170 = call i32 @test9(i32 -20)
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %172, label %173

; <label>:172                                     ; preds = %169
  call void @abort() #2
  unreachable

; <label>:173                                     ; preds = %169
  %174 = call i32 @test9(i32 -19)
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %173
  call void @abort() #2
  unreachable

; <label>:177                                     ; preds = %173
  %178 = call i32 @test10(i32 0)
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %180, label %181

; <label>:180                                     ; preds = %177
  call void @abort() #2
  unreachable

; <label>:181                                     ; preds = %177
  %182 = call i32 @test10(i32 9)
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %181
  call void @abort() #2
  unreachable

; <label>:185                                     ; preds = %181
  %186 = call i32 @test10(i32 10)
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %189

; <label>:188                                     ; preds = %185
  call void @abort() #2
  unreachable

; <label>:189                                     ; preds = %185
  %190 = call i32 @test10(i32 -1)
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %189
  call void @abort() #2
  unreachable

; <label>:193                                     ; preds = %189
  %194 = call i32 @test10(i32 -9)
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %193
  call void @abort() #2
  unreachable

; <label>:197                                     ; preds = %193
  %198 = call i32 @test10(i32 -10)
  %199 = icmp ne i32 %198, 1
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %197
  call void @abort() #2
  unreachable

; <label>:201                                     ; preds = %197
  %202 = call i32 @test11(i32 -30)
  %203 = icmp ne i32 %202, 1
  br i1 %203, label %204, label %205

; <label>:204                                     ; preds = %201
  call void @abort() #2
  unreachable

; <label>:205                                     ; preds = %201
  %206 = call i32 @test11(i32 -29)
  %207 = icmp ne i32 %206, 1
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %205
  call void @abort() #2
  unreachable

; <label>:209                                     ; preds = %205
  %210 = call i32 @test11(i32 -20)
  %211 = icmp ne i32 %210, 1
  br i1 %211, label %212, label %213

; <label>:212                                     ; preds = %209
  call void @abort() #2
  unreachable

; <label>:213                                     ; preds = %209
  %214 = call i32 @test11(i32 -19)
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %217

; <label>:216                                     ; preds = %213
  call void @abort() #2
  unreachable

; <label>:217                                     ; preds = %213
  %218 = call i32 @test12(i32 0)
  %219 = icmp ne i32 %218, 1
  br i1 %219, label %220, label %221

; <label>:220                                     ; preds = %217
  call void @abort() #2
  unreachable

; <label>:221                                     ; preds = %217
  %222 = call i32 @test12(i32 9)
  %223 = icmp ne i32 %222, 1
  br i1 %223, label %224, label %225

; <label>:224                                     ; preds = %221
  call void @abort() #2
  unreachable

; <label>:225                                     ; preds = %221
  %226 = call i32 @test12(i32 10)
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %229

; <label>:228                                     ; preds = %225
  call void @abort() #2
  unreachable

; <label>:229                                     ; preds = %225
  %230 = call i32 @test12(i32 -1)
  %231 = icmp ne i32 %230, 1
  br i1 %231, label %232, label %233

; <label>:232                                     ; preds = %229
  call void @abort() #2
  unreachable

; <label>:233                                     ; preds = %229
  %234 = call i32 @test12(i32 -9)
  %235 = icmp ne i32 %234, 1
  br i1 %235, label %236, label %237

; <label>:236                                     ; preds = %233
  call void @abort() #2
  unreachable

; <label>:237                                     ; preds = %233
  %238 = call i32 @test12(i32 -10)
  %239 = icmp ne i32 %238, 1
  br i1 %239, label %240, label %241

; <label>:240                                     ; preds = %237
  call void @abort() #2
  unreachable

; <label>:241                                     ; preds = %237
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
