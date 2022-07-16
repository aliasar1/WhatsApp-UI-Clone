class CallLog {
  final String date, callStatus;
  final bool isVideoCall;

  CallLog({
    this.date = '',
    this.callStatus = '',
    this.isVideoCall = false,
  });
}

List callsData = [
  CallLog(
    date: 'Today, 12:19 am',
    callStatus: 'incoming',
    isVideoCall: false,
  ),
  CallLog(
    date: 'Yesterday, 11:45 pm',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    date: 'Yesterday, 11:57 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
  CallLog(
    date: '14 July, 9:19 am',
    callStatus: 'incoming',
    isVideoCall: false,
  ),
  CallLog(
    date: '13 July, 11:19 pm',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    date: '13 July, 11:50 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
  CallLog(
    date: '11 July, 10:19 am',
    callStatus: 'incoming',
    isVideoCall: true,
  ),
  CallLog(
    date: '10 July, 1:19 pm',
    callStatus: 'outgoing',
    isVideoCall: false,
  ),
];
