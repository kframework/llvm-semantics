; ModuleID = 'exception_spec_test.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__fundamental_type_info_pseudo = type { %struct.__type_info_pseudo }
%struct.__type_info_pseudo = type { i8*, i8* }

@.str = private constant [41 x i8] c"std::unexpected called: throwing an int!\00", align 1 ; <[41 x i8]*> [#uses=1]
@_ZTIi = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str1 = private constant [42 x i8] c"std::unexpected called: throwing a double\00", align 1 ; <[42 x i8]*> [#uses=1]
@_ZTId = external constant %struct.__fundamental_type_info_pseudo ; <%struct.__fundamental_type_info_pseudo*> [#uses=1]
@.str2 = private constant [35 x i8] c"std::terminate called, as expected\00", align 1 ; <[35 x i8]*> [#uses=1]
@.str3 = private constant [48 x i8] c"std::terminate called, but it was not expected!\00", align 1 ; <[48 x i8]*> [#uses=1]
@.str4 = private constant [59 x i8] c"Throwing an int from a function which only allows doubles!\00", align 1 ; <[59 x i8]*> [#uses=1]
@.str5 = private constant [56 x i8] c"Throwing a double from a function which allows doubles!\00", align 1 ; <[56 x i8]*> [#uses=1]
@.str6 = private constant [28 x i8] c"Double successfully caught!\00", align 1 ; <[28 x i8]*> [#uses=1]

define internal fastcc void @_Z4testb(i8 zeroext %Int) noreturn {
entry:
  %toBool = icmp eq i8 %Int, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %invcont3, label %invcont

invcont:                                          ; preds = %entry
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8]* @.str4, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = tail call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  store i32 1, i32* %2, align 4
  invoke void @__cxa_throw(i8* %1, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
          to label %invcont1 unwind label %lpad

invcont1:                                         ; preds = %invcont
  unreachable

invcont3:                                         ; preds = %entry
  %3 = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8]* @.str5, i32 0, i32 0)) ; <i32> [#uses=0]
  %4 = tail call i8* @__cxa_allocate_exception(i32 8) nounwind ; <i8*> [#uses=2]
  %5 = bitcast i8* %4 to double*                  ; <double*> [#uses=1]
  store double 1.000000e+00, double* %5, align 8
  invoke void @__cxa_throw(i8* %4, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*), void (i8*)* null) noreturn
          to label %invcont4 unwind label %lpad

invcont4:                                         ; preds = %invcont3
  unreachable

bb5:                                              ; preds = %lpad
  tail call void @__cxa_call_unexpected(i8* %eh_ptr) noreturn
  unreachable

lpad:                                             ; preds = %invcont3, %invcont
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=3]
  %eh_select = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i32 2, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*), i8* null) ; <i32> [#uses=1]
  %6 = icmp slt i32 %eh_select, 0                 ; <i1> [#uses=1]
  br i1 %6, label %bb5, label %Unwind

Unwind:                                           ; preds = %lpad
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_ptr)
  unreachable
}

define internal void @_ZL18UnexpectedHandler2v() noreturn {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([41 x i8]* @.str, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = tail call i8* @__cxa_allocate_exception(i32 4) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  store i32 1, i32* %2, align 4
  tail call void @__cxa_throw(i8* %1, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTIi to i8*), void (i8*)* null) noreturn
  unreachable
}

declare i32 @puts(i8* nocapture) nounwind

declare i8* @__cxa_allocate_exception(i32) nounwind

declare void @__cxa_throw(i8*, i8*, void (i8*)*) noreturn

define internal void @_ZL18UnexpectedHandler1v() noreturn {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @.str1, i32 0, i32 0)) ; <i32> [#uses=0]
  %1 = tail call i8* @__cxa_allocate_exception(i32 8) nounwind ; <i8*> [#uses=2]
  %2 = bitcast i8* %1 to double*                  ; <double*> [#uses=1]
  store double 1.000000e+00, double* %2, align 8
  tail call void @__cxa_throw(i8* %1, i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*), void (i8*)* null) noreturn
  unreachable
}

define internal void @_ZL17TerminateHandler0v() noreturn nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)) ; <i32> [#uses=0]
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define internal void @_ZL17TerminateHandler1v() noreturn nounwind {
entry:
  %0 = tail call i32 @puts(i8* getelementptr inbounds ([48 x i8]* @.str3, i32 0, i32 0)) ; <i32> [#uses=0]
  tail call void @exit(i32 1) noreturn nounwind
  unreachable
}

declare void @__cxa_call_unexpected(i8*) noreturn

declare i8* @llvm.eh.exception() nounwind

declare i32 @llvm.eh.selector.i32(i8*, i8*, ...) nounwind

declare i32 @llvm.eh.typeid.for.i32(i8*) nounwind

declare i32 @__gxx_personality_v0(...)

declare void @_Unwind_Resume_or_Rethrow(i8*)

define i32 @main() noreturn {
entry:
  %0 = tail call void ()* (void ()*)* @_ZSt13set_terminatePFvvE(void ()* @_ZL17TerminateHandler1v) nounwind ; <void ()*> [#uses=0]
  invoke fastcc void @_Z4testb(i8 zeroext 0)
          to label %bb8 unwind label %lpad

bb7:                                              ; preds = %lpad
  %1 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr) nounwind ; <i8*> [#uses=0]
  %2 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0)) ; <i32> [#uses=0]
  tail call void @__cxa_end_catch()
  br label %bb8

bb8:                                              ; preds = %bb7, %entry
  %3 = tail call void ()* (void ()*)* @_ZSt14set_unexpectedPFvvE(void ()* @_ZL18UnexpectedHandler1v) nounwind ; <void ()*> [#uses=0]
  invoke fastcc void @_Z4testb(i8 zeroext 1)
          to label %bb19 unwind label %lpad31

bb18:                                             ; preds = %lpad31
  %4 = tail call i8* @__cxa_begin_catch(i8* %eh_ptr32) nounwind ; <i8*> [#uses=0]
  %5 = tail call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @.str6, i32 0, i32 0)) ; <i32> [#uses=0]
  tail call void @__cxa_end_catch()
  br label %bb19

bb19:                                             ; preds = %bb18, %bb8
  %6 = tail call void ()* (void ()*)* @_ZSt13set_terminatePFvvE(void ()* @_ZL17TerminateHandler0v) nounwind ; <void ()*> [#uses=0]
  %7 = tail call void ()* (void ()*)* @_ZSt14set_unexpectedPFvvE(void ()* @_ZL18UnexpectedHandler2v) nounwind ; <void ()*> [#uses=0]
  tail call fastcc void @_Z4testb(i8 zeroext 1)
  unreachable

lpad:                                             ; preds = %entry
  %eh_ptr = tail call i8* @llvm.eh.exception()    ; <i8*> [#uses=3]
  %eh_select22 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*)) ; <i32> [#uses=1]
  %8 = icmp eq i32 %eh_select22, %eh_typeid       ; <i1> [#uses=1]
  br i1 %8, label %bb7, label %Unwind

lpad31:                                           ; preds = %bb8
  %eh_ptr32 = tail call i8* @llvm.eh.exception()  ; <i8*> [#uses=3]
  %eh_select34 = tail call i32 (i8*, i8*, ...)* @llvm.eh.selector.i32(i8* %eh_ptr32, i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*), i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*), i8* null) ; <i32> [#uses=1]
  %eh_typeid46 = tail call i32 @llvm.eh.typeid.for.i32(i8* bitcast (%struct.__fundamental_type_info_pseudo* @_ZTId to i8*)) ; <i32> [#uses=1]
  %9 = icmp eq i32 %eh_select34, %eh_typeid46     ; <i1> [#uses=1]
  br i1 %9, label %bb18, label %Unwind

Unwind:                                           ; preds = %lpad31, %lpad
  %eh_exception.0 = phi i8* [ %eh_ptr, %lpad ], [ %eh_ptr32, %lpad31 ] ; <i8*> [#uses=1]
  tail call void @_Unwind_Resume_or_Rethrow(i8* %eh_exception.0)
  unreachable
}

declare void ()* @_ZSt13set_terminatePFvvE(void ()*) nounwind

declare i8* @__cxa_begin_catch(i8*) nounwind

declare void @__cxa_end_catch()

declare void ()* @_ZSt14set_unexpectedPFvvE(void ()*) nounwind
