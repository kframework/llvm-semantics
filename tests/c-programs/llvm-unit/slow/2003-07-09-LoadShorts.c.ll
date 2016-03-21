; ModuleID = './2003-07-09-LoadShorts.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ShortsSet_struct = type { i32, i32, i16, i16, i8, i8 }

@.str = private unnamed_addr constant [42 x i8] c"   ui = %u (0x%x)\09\09UL-ui = %lld (0x%llx)\0A\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"ui*ui = %u (0x%x)\09  UL/ui = %lld (0x%llx)\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"    i = %d (0x%x)\09L-i = %lld (0x%llx)\0A\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c" i* i = %d (0x%x)\09L/ i = %lld (0x%llx)\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [42 x i8] c"us    = %u (0x%x)\09\09UL-us = %lld (0x%llx)\0A\00", align 1
@.str.5 = private unnamed_addr constant [44 x i8] c"us*us = %u (0x%x)\09  UL/us = %lld (0x%llx)\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c" s    = %d (0x%x)\09L-s = %lld (0x%llx)\0A\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c" s* s = %d (0x%x)\09L/ s = %lld (0x%llx)\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [42 x i8] c"ub    = %u (0x%x)\09\09UL-ub = %lld (0x%llx)\0A\00", align 1
@.str.9 = private unnamed_addr constant [43 x i8] c"ub*ub = %u (0x%x)\09\09UL/ub = %lld (0x%llx)\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [40 x i8] c" b    = %d (0x%x)\09\09L-b = %lld (0x%llx)\0A\00", align 1
@.str.11 = private unnamed_addr constant [42 x i8] c" b* b = %d (0x%x)\09\09\09L/b = %lld (0x%llx)\0A\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @getL() #0 {
  ret i64 -5787213826675591005
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %UL = alloca i64, align 8
  %L = alloca i64, align 8
  %S = alloca %struct.ShortsSet_struct*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = call i64 @getL()
  store i64 %4, i64* %UL, align 8
  %5 = load i64, i64* %UL, align 8
  store i64 %5, i64* %L, align 8
  %6 = call noalias i8* @malloc(i64 16) #3
  %7 = bitcast i8* %6 to %struct.ShortsSet_struct*
  store %struct.ShortsSet_struct* %7, %struct.ShortsSet_struct** %S, align 8
  %8 = load i64, i64* %UL, align 8
  %9 = trunc i64 %8 to i32
  %10 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %11 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %10, i32 0, i32 0
  store i32 %9, i32* %11, align 4
  %12 = load i64, i64* %UL, align 8
  %13 = trunc i64 %12 to i32
  %14 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %15 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %14, i32 0, i32 1
  store i32 %13, i32* %15, align 4
  %16 = load i64, i64* %UL, align 8
  %17 = trunc i64 %16 to i16
  %18 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %19 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %18, i32 0, i32 2
  store i16 %17, i16* %19, align 2
  %20 = load i64, i64* %UL, align 8
  %21 = trunc i64 %20 to i16
  %22 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %23 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %22, i32 0, i32 3
  store i16 %21, i16* %23, align 2
  %24 = load i64, i64* %UL, align 8
  %25 = trunc i64 %24 to i8
  %26 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %27 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %26, i32 0, i32 4
  store i8 %25, i8* %27, align 1
  %28 = load i64, i64* %UL, align 8
  %29 = trunc i64 %28 to i8
  %30 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %31 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %30, i32 0, i32 5
  store i8 %29, i8* %31, align 1
  %32 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %33 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %32, i32 0, i32 0
  %34 = load i32, i32* %33, align 4
  %35 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %36 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %35, i32 0, i32 0
  %37 = load i32, i32* %36, align 4
  %38 = load i64, i64* %UL, align 8
  %39 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %40 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 4
  %42 = zext i32 %41 to i64
  %43 = sub i64 %38, %42
  %44 = load i64, i64* %UL, align 8
  %45 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %46 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %45, i32 0, i32 0
  %47 = load i32, i32* %46, align 4
  %48 = zext i32 %47 to i64
  %49 = sub i64 %44, %48
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), i32 %34, i32 %37, i64 %43, i64 %49)
  %51 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %52 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %51, i32 0, i32 0
  %53 = load i32, i32* %52, align 4
  %54 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %55 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %54, i32 0, i32 0
  %56 = load i32, i32* %55, align 4
  %57 = mul i32 %53, %56
  %58 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %59 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %58, i32 0, i32 0
  %60 = load i32, i32* %59, align 4
  %61 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %62 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %61, i32 0, i32 0
  %63 = load i32, i32* %62, align 4
  %64 = mul i32 %60, %63
  %65 = load i64, i64* %UL, align 8
  %66 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %67 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 4
  %69 = zext i32 %68 to i64
  %70 = udiv i64 %65, %69
  %71 = load i64, i64* %UL, align 8
  %72 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %73 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %72, i32 0, i32 0
  %74 = load i32, i32* %73, align 4
  %75 = zext i32 %74 to i64
  %76 = udiv i64 %71, %75
  %77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.1, i32 0, i32 0), i32 %57, i32 %64, i64 %70, i64 %76)
  %78 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %79 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %78, i32 0, i32 1
  %80 = load i32, i32* %79, align 4
  %81 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %82 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %81, i32 0, i32 1
  %83 = load i32, i32* %82, align 4
  %84 = load i64, i64* %L, align 8
  %85 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %86 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %85, i32 0, i32 1
  %87 = load i32, i32* %86, align 4
  %88 = sext i32 %87 to i64
  %89 = sub nsw i64 %84, %88
  %90 = load i64, i64* %L, align 8
  %91 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %92 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %91, i32 0, i32 1
  %93 = load i32, i32* %92, align 4
  %94 = sext i32 %93 to i64
  %95 = sub nsw i64 %90, %94
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i32 0, i32 0), i32 %80, i32 %83, i64 %89, i64 %95)
  %97 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %98 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %97, i32 0, i32 1
  %99 = load i32, i32* %98, align 4
  %100 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %101 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %100, i32 0, i32 1
  %102 = load i32, i32* %101, align 4
  %103 = mul nsw i32 %99, %102
  %104 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %105 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %104, i32 0, i32 1
  %106 = load i32, i32* %105, align 4
  %107 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %108 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %107, i32 0, i32 1
  %109 = load i32, i32* %108, align 4
  %110 = mul nsw i32 %106, %109
  %111 = load i64, i64* %L, align 8
  %112 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %113 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %112, i32 0, i32 1
  %114 = load i32, i32* %113, align 4
  %115 = sext i32 %114 to i64
  %116 = sdiv i64 %111, %115
  %117 = load i64, i64* %L, align 8
  %118 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %119 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %118, i32 0, i32 1
  %120 = load i32, i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = sdiv i64 %117, %121
  %123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3, i32 0, i32 0), i32 %103, i32 %110, i64 %116, i64 %122)
  %124 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %125 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %124, i32 0, i32 2
  %126 = load i16, i16* %125, align 2
  %127 = zext i16 %126 to i32
  %128 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %129 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %128, i32 0, i32 2
  %130 = load i16, i16* %129, align 2
  %131 = zext i16 %130 to i32
  %132 = load i64, i64* %UL, align 8
  %133 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %134 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %133, i32 0, i32 2
  %135 = load i16, i16* %134, align 2
  %136 = zext i16 %135 to i64
  %137 = sub i64 %132, %136
  %138 = load i64, i64* %UL, align 8
  %139 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %140 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %139, i32 0, i32 2
  %141 = load i16, i16* %140, align 2
  %142 = zext i16 %141 to i64
  %143 = sub i64 %138, %142
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.4, i32 0, i32 0), i32 %127, i32 %131, i64 %137, i64 %143)
  %145 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %146 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %145, i32 0, i32 2
  %147 = load i16, i16* %146, align 2
  %148 = zext i16 %147 to i32
  %149 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %150 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %149, i32 0, i32 2
  %151 = load i16, i16* %150, align 2
  %152 = zext i16 %151 to i32
  %153 = mul nsw i32 %148, %152
  %154 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %155 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %154, i32 0, i32 2
  %156 = load i16, i16* %155, align 2
  %157 = zext i16 %156 to i32
  %158 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %159 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %158, i32 0, i32 2
  %160 = load i16, i16* %159, align 2
  %161 = zext i16 %160 to i32
  %162 = mul nsw i32 %157, %161
  %163 = load i64, i64* %UL, align 8
  %164 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %165 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %164, i32 0, i32 2
  %166 = load i16, i16* %165, align 2
  %167 = zext i16 %166 to i64
  %168 = udiv i64 %163, %167
  %169 = load i64, i64* %UL, align 8
  %170 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %171 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %170, i32 0, i32 2
  %172 = load i16, i16* %171, align 2
  %173 = zext i16 %172 to i64
  %174 = udiv i64 %169, %173
  %175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.5, i32 0, i32 0), i32 %153, i32 %162, i64 %168, i64 %174)
  %176 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %177 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %176, i32 0, i32 3
  %178 = load i16, i16* %177, align 2
  %179 = sext i16 %178 to i32
  %180 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %181 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %180, i32 0, i32 3
  %182 = load i16, i16* %181, align 2
  %183 = sext i16 %182 to i32
  %184 = load i64, i64* %L, align 8
  %185 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %186 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %185, i32 0, i32 3
  %187 = load i16, i16* %186, align 2
  %188 = sext i16 %187 to i64
  %189 = sub nsw i64 %184, %188
  %190 = load i64, i64* %L, align 8
  %191 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %192 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %191, i32 0, i32 3
  %193 = load i16, i16* %192, align 2
  %194 = sext i16 %193 to i64
  %195 = sub nsw i64 %190, %194
  %196 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i32 0, i32 0), i32 %179, i32 %183, i64 %189, i64 %195)
  %197 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %198 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %197, i32 0, i32 3
  %199 = load i16, i16* %198, align 2
  %200 = sext i16 %199 to i32
  %201 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %202 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %201, i32 0, i32 3
  %203 = load i16, i16* %202, align 2
  %204 = sext i16 %203 to i32
  %205 = mul nsw i32 %200, %204
  %206 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %207 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %206, i32 0, i32 3
  %208 = load i16, i16* %207, align 2
  %209 = sext i16 %208 to i32
  %210 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %211 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %210, i32 0, i32 3
  %212 = load i16, i16* %211, align 2
  %213 = sext i16 %212 to i32
  %214 = mul nsw i32 %209, %213
  %215 = load i64, i64* %L, align 8
  %216 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %217 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %216, i32 0, i32 3
  %218 = load i16, i16* %217, align 2
  %219 = sext i16 %218 to i64
  %220 = sdiv i64 %215, %219
  %221 = load i64, i64* %L, align 8
  %222 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %223 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %222, i32 0, i32 3
  %224 = load i16, i16* %223, align 2
  %225 = sext i16 %224 to i64
  %226 = sdiv i64 %221, %225
  %227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i32 0, i32 0), i32 %205, i32 %214, i64 %220, i64 %226)
  %228 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %229 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %228, i32 0, i32 4
  %230 = load i8, i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %233 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %232, i32 0, i32 4
  %234 = load i8, i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = load i64, i64* %UL, align 8
  %237 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %238 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %237, i32 0, i32 4
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i64
  %241 = sub i64 %236, %240
  %242 = load i64, i64* %UL, align 8
  %243 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %244 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %243, i32 0, i32 4
  %245 = load i8, i8* %244, align 1
  %246 = zext i8 %245 to i64
  %247 = sub i64 %242, %246
  %248 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.8, i32 0, i32 0), i32 %231, i32 %235, i64 %241, i64 %247)
  %249 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %250 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %249, i32 0, i32 4
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %254 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %253, i32 0, i32 4
  %255 = load i8, i8* %254, align 1
  %256 = zext i8 %255 to i32
  %257 = mul nsw i32 %252, %256
  %258 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %259 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %258, i32 0, i32 4
  %260 = load i8, i8* %259, align 1
  %261 = zext i8 %260 to i32
  %262 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %263 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %262, i32 0, i32 4
  %264 = load i8, i8* %263, align 1
  %265 = zext i8 %264 to i32
  %266 = mul nsw i32 %261, %265
  %267 = load i64, i64* %UL, align 8
  %268 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %269 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %268, i32 0, i32 4
  %270 = load i8, i8* %269, align 1
  %271 = zext i8 %270 to i64
  %272 = udiv i64 %267, %271
  %273 = load i64, i64* %UL, align 8
  %274 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %275 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %274, i32 0, i32 4
  %276 = load i8, i8* %275, align 1
  %277 = zext i8 %276 to i64
  %278 = udiv i64 %273, %277
  %279 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.9, i32 0, i32 0), i32 %257, i32 %266, i64 %272, i64 %278)
  %280 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %281 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %280, i32 0, i32 5
  %282 = load i8, i8* %281, align 1
  %283 = sext i8 %282 to i32
  %284 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %285 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %284, i32 0, i32 5
  %286 = load i8, i8* %285, align 1
  %287 = sext i8 %286 to i32
  %288 = load i64, i64* %L, align 8
  %289 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %290 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %289, i32 0, i32 5
  %291 = load i8, i8* %290, align 1
  %292 = sext i8 %291 to i64
  %293 = sub nsw i64 %288, %292
  %294 = load i64, i64* %L, align 8
  %295 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %296 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %295, i32 0, i32 5
  %297 = load i8, i8* %296, align 1
  %298 = sext i8 %297 to i64
  %299 = sub nsw i64 %294, %298
  %300 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.10, i32 0, i32 0), i32 %283, i32 %287, i64 %293, i64 %299)
  %301 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %302 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %301, i32 0, i32 5
  %303 = load i8, i8* %302, align 1
  %304 = sext i8 %303 to i32
  %305 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %306 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %305, i32 0, i32 5
  %307 = load i8, i8* %306, align 1
  %308 = sext i8 %307 to i32
  %309 = mul nsw i32 %304, %308
  %310 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %311 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %310, i32 0, i32 5
  %312 = load i8, i8* %311, align 1
  %313 = sext i8 %312 to i32
  %314 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %315 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %314, i32 0, i32 5
  %316 = load i8, i8* %315, align 1
  %317 = sext i8 %316 to i32
  %318 = mul nsw i32 %313, %317
  %319 = load i64, i64* %L, align 8
  %320 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %321 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %320, i32 0, i32 5
  %322 = load i8, i8* %321, align 1
  %323 = sext i8 %322 to i64
  %324 = sdiv i64 %319, %323
  %325 = load i64, i64* %L, align 8
  %326 = load %struct.ShortsSet_struct*, %struct.ShortsSet_struct** %S, align 8
  %327 = getelementptr inbounds %struct.ShortsSet_struct, %struct.ShortsSet_struct* %326, i32 0, i32 5
  %328 = load i8, i8* %327, align 1
  %329 = sext i8 %328 to i64
  %330 = sdiv i64 %325, %329
  %331 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.11, i32 0, i32 0), i32 %309, i32 %318, i64 %324, i64 %330)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
