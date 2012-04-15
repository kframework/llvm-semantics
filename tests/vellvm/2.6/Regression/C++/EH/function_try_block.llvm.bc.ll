; ModuleID = 'function_try_block.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.A = type { i32 }
%struct.B = type { %struct.A, %struct.A, %struct.A, i32, %struct.A, %struct.A }
%struct.__fundamental_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@.str = private constant [17 x i8] c"Destroyed A #%d\0A\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str1 = private constant [14 x i8] c"B destructor!\00", align 1 ; <[14 x i8]*> [#uses=1]
@_ZL5NumAs = internal global i32 0                ; <i32*> [#uses=10]
@.str2 = private constant [15 x i8] c"Created A #%d\0A\00", align 1 ; <[15 x i8]*> [#uses=1]
@_ZL11ShouldThrow.b = internal global i1 false    ; <i1*> [#uses=2]
@_ZTIi = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str3 = private constant [41 x i8] c"'throws' threw an exception: rethrowing!\00", align 1 ; <[41 x i8]*> [#uses=1]
@.str4 = private constant [18 x i8] c"In B constructor!\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str5 = private constant [47 x i8] c"In B catch block with int %d: auto rethrowing\0A\00", align 1 ; <[47 x i8]*> [#uses=1]
@.str6 = private constant [18 x i8] c"Caught exception!\00", align 1 ; <[18 x i8]*> [#uses=1]

declare i32 @printf(i8* noalias nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare void @_ZSt9terminatev() noreturn nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_rethrow() noreturn

declare void @__cxa_end_catch()

define internal fastcc void @_ZN1BC2Ev(%struct.B* nocapture %this) {
invcont2:
  %0 = load i32* @_ZL5NumAs, align 4              ; <i32> [#uses=3]
  %1 = getelementptr inbounds %struct.B* %this, i32 0, i32 0, i32 0 ; <i32*> [#uses=2]
  store i32 %0, i32* %1, align 4
  %2 = add i32 %0, 1                              ; <i32> [#uses=1]
  store i32 %2, i32* @_ZL5NumAs, align 4
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %0) nounwind ; <i32> [#uses=0]
  %4 = load i32* @_ZL5NumAs, align 4              ; <i32> [#uses=3]
  %5 = getelementptr inbounds %struct.B* %this, i32 0, i32 1, i32 0 ; <i32*> [#uses=2]
  store i32 %4, i32* %5, align 4
  %6 = add i32 %4, 1                              ; <i32> [#uses=1]
  store i32 %6, i32* @_ZL5NumAs, align 4
  %7 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %4) nounwind ; <i32> [#uses=0]
  %8 = load i32* @_ZL5NumAs, align 4              ; <i32> [#uses=3]
  %9 = getelementptr inbounds %struct.B* %this, i32 0, i32 2, i32 0 ; <i32*> [#uses=2]
  store i32 %8, i32* %9, align 4
  %10 = add i32 %8, 1                             ; <i32> [#uses=1]
  store i32 %10, i32* @_ZL5NumAs, align 4
  %11 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %8) nounwind ; <i32> [#uses=0]
  %.b.i = load i1* @_ZL11ShouldThrow.b            ; <i1> [#uses=1]
  br i1 %.b.i, label %bb.i, label %return

bb.i:                                             ; preds = %invcont2
  %12 = call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %13 = bitcast i8* %12 to i32*                   ; <i32*> [#uses=1]
  store i32 7, i32* %13, align 4
  invoke void @__cxa_throw(i8* %12, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %invcont.i unwind label %invcont3.i

invcont.i:                                        ; preds = %bb.i
  unreachable

invcont3.i:                                       ; preds = %bb.i
  %eh_ptr.i = call i8* @llvm.eh.exception()       ; <i8*> [#uses=2]
  %eh_select11.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %14 = call i8* @__cxa_begin_catch(i8* %eh_ptr.i) nounwind ; <i8*> [#uses=0]
  %15 = call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @.str3, i32 0, i32 0)) ; <i32> [#uses=0]
  invoke void @__cxa_rethrow() noreturn
          to label %invcont4.i unwind label %lpad12.i

invcont4.i:                                       ; preds = %invcont3.i
  unreachable

invcont7.i:                                       ; preds = %lpad12.i
  invoke void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr13.i)
          to label %.noexc unwind label %ppad98

.noexc:                                           ; preds = %invcont7.i
  unreachable

lpad12.i:                                         ; preds = %invcont3.i
  %eh_ptr13.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=2]
  %eh_select15.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr13.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %invcont7.i unwind label %lpad16.i

lpad16.i:                                         ; preds = %lpad12.i
  %eh_ptr17.i = call i8* @llvm.eh.exception()     ; <i8*> [#uses=1]
  %eh_select19.i = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr17.i, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  call void @_ZSt9terminatev() noreturn nounwind
  unreachable

invcont31:                                        ; preds = %ppad98
  %16 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr50) nounwind ; <i8*> [#uses=1]
  %17 = bitcast i8* %16 to i32*                   ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4                    ; <i32> [#uses=1]
  %19 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([47 x i8]* @.str5, i32 0, i32 0), i32 %18) ; <i32> [#uses=0]
  invoke void @__cxa_rethrow() noreturn
          to label %invcont32 unwind label %lpad81

invcont32:                                        ; preds = %invcont31
  unreachable

return:                                           ; preds = %invcont2
  %20 = getelementptr inbounds %struct.B* %this, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 123, i32* %20, align 4
  %21 = load i32* @_ZL5NumAs, align 4             ; <i32> [#uses=3]
  %22 = getelementptr inbounds %struct.B* %this, i32 0, i32 4, i32 0 ; <i32*> [#uses=1]
  store i32 %21, i32* %22, align 4
  %23 = add i32 %21, 1                            ; <i32> [#uses=1]
  store i32 %23, i32* @_ZL5NumAs, align 4
  %24 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %21) nounwind ; <i32> [#uses=0]
  %25 = load i32* @_ZL5NumAs, align 4             ; <i32> [#uses=3]
  %26 = getelementptr inbounds %struct.B* %this, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4
  %27 = add i32 %25, 1                            ; <i32> [#uses=1]
  store i32 %27, i32* @_ZL5NumAs, align 4
  %28 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %25) nounwind ; <i32> [#uses=0]
  %29 = tail call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str4, i32 0, i32 0)) ; <i32> [#uses=0]
  ret void

lpad81:                                           ; preds = %invcont31
  %eh_ptr82 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=2]
  %eh_select84 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr82, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  invoke void @__cxa_end_catch()
          to label %Unwind unwind label %lpad85

lpad85:                                           ; preds = %lpad81
  %eh_ptr86 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=1]
  %eh_select88 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr86, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 1) ; <i32> [#uses=0]
  tail call void @_ZSt9terminatev() noreturn nounwind
  unreachable

ppad98:                                           ; preds = %invcont7.i
  %eh_ptr50 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=3]
  %eh_select52 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr50, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), i8* null) ; <i32> [#uses=1]
  %30 = load i32* %9, align 4                     ; <i32> [#uses=1]
  %31 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %30) nounwind ; <i32> [#uses=0]
  %32 = load i32* %5, align 4                     ; <i32> [#uses=1]
  %33 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %32) nounwind ; <i32> [#uses=0]
  %34 = load i32* %1, align 4                     ; <i32> [#uses=1]
  %35 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %34) nounwind ; <i32> [#uses=0]
  %eh_typeid = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*)) ; <i32> [#uses=1]
  %36 = icmp eq i32 %eh_select52, %eh_typeid      ; <i1> [#uses=1]
  br i1 %36, label %invcont31, label %Unwind

Unwind:                                           ; preds = %ppad98, %lpad81
  %eh_exception.5 = phi i8* [ %eh_ptr82, %lpad81 ], [ %eh_ptr50, %ppad98 ] ; <i8*> [#uses=1]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.5)
  unreachable
}

define i32 @main() {
entry:
  %b = alloca %struct.B, align 8                  ; <%struct.B*> [#uses=6]
  %b1 = alloca %struct.B, align 8                 ; <%struct.B*> [#uses=6]
  call fastcc void @_ZN1BC2Ev(%struct.B* %b1)
  %0 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = getelementptr inbounds %struct.B* %b1, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4                      ; <i32> [#uses=1]
  %3 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %2) nounwind ; <i32> [#uses=0]
  %4 = getelementptr inbounds %struct.B* %b1, i32 0, i32 4, i32 0 ; <i32*> [#uses=1]
  %5 = load i32* %4, align 8                      ; <i32> [#uses=1]
  %6 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %5) nounwind ; <i32> [#uses=0]
  %7 = getelementptr inbounds %struct.B* %b1, i32 0, i32 2, i32 0 ; <i32*> [#uses=1]
  %8 = load i32* %7, align 8                      ; <i32> [#uses=1]
  %9 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %8) nounwind ; <i32> [#uses=0]
  %10 = getelementptr inbounds %struct.B* %b1, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %11 = load i32* %10, align 4                    ; <i32> [#uses=1]
  %12 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %11) nounwind ; <i32> [#uses=0]
  %13 = getelementptr inbounds %struct.B* %b1, i32 0, i32 0, i32 0 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 8                    ; <i32> [#uses=1]
  %15 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %14) nounwind ; <i32> [#uses=0]
  store i1 true, i1* @_ZL11ShouldThrow.b
  invoke fastcc void @_ZN1BC2Ev(%struct.B* %b)
          to label %bb9 unwind label %bb8

bb8:                                              ; preds = %entry
  %eh_ptr = call i8* @llvm.eh.exception()         ; <i8*> [#uses=2]
  %eh_select12 = call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* null) ; <i32> [#uses=0]
  %16 = call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %17 = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @.str6, i32 0, i32 0)) ; <i32> [#uses=0]
  call void @__cxa_end_catch()
  ret i32 0

bb9:                                              ; preds = %entry
  %18 = call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0)) ; <i32> [#uses=0]
  %19 = getelementptr inbounds %struct.B* %b, i32 0, i32 5, i32 0 ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %20) nounwind ; <i32> [#uses=0]
  %22 = getelementptr inbounds %struct.B* %b, i32 0, i32 4, i32 0 ; <i32*> [#uses=1]
  %23 = load i32* %22, align 8                    ; <i32> [#uses=1]
  %24 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %23) nounwind ; <i32> [#uses=0]
  %25 = getelementptr inbounds %struct.B* %b, i32 0, i32 2, i32 0 ; <i32*> [#uses=1]
  %26 = load i32* %25, align 8                    ; <i32> [#uses=1]
  %27 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %26) nounwind ; <i32> [#uses=0]
  %28 = getelementptr inbounds %struct.B* %b, i32 0, i32 1, i32 0 ; <i32*> [#uses=1]
  %29 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %30 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %29) nounwind ; <i32> [#uses=0]
  %31 = getelementptr inbounds %struct.B* %b, i32 0, i32 0, i32 0 ; <i32*> [#uses=1]
  %32 = load i32* %31, align 8                    ; <i32> [#uses=1]
  %33 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([17 x i8]* @.str, i32 0, i32 0), i32 %32) nounwind ; <i32> [#uses=0]
  ret i32 0
}
