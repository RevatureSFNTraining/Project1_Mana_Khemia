public class EmoteStatsWrapper implements Comparable {
    public String emote;
    public Integer count;
    public EmoteStatsWrapper(String emote, Integer count) {
        this.emote = emote;
        this.count = count;
    }

    public Integer compareTo(Object other) {
        return count - ((EmoteStatsWrapper)other).count;
    }
}