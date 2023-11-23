(function onLoad() {
    const params = new URLSearchParams(document.location.search);
    const scheduleId = params.get("schedule_id");
    console.log({ scheduleId })
})();