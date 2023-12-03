(function onLoad() {
    const params = new URLSearchParams(document.location.search);
    const token = params.get("token");
    const { schedule_id } = JSON.parse(atob(token));
    console.log({ decoded: JSON.parse(atob(token)) });
    console.log(schedule_id);
})();