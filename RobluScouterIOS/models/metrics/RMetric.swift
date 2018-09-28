import Foundation

/*
 * This defines the superclass for how a metric should work.
 * All metrics should extend this class.
 *
 * @author Will Davies
 */
class RMetric {
    
    public var ID: Int; // A unique ID to distinguish this metric from others
    public var title: String; // The title of this metric
    private var modified: Bool; // Represents whether this value has been edited by the user or not
    
    init(ID: Int, title: String) {
        self.ID = ID;
        self.title = title;
        self.modified = false;
    }
    
    // If the user is editing a custom form, cards are loaded that give a snapshot of what a metric
    // is. This returns a short string describing the metrics and the values it contains. Note, when
    // the form editor is displayed, it will create arbitrary metrics and use the values in them to store
    // default values, not actual values. So this method can safely assume the values of its metrics are
    // actually default values and not scouting data.
    public func getFormDescriptor() -> String {
        preconditionFailure("This method must be overriden by its children");
    }
    
    // This creates a new instance of the metric to prevent certain syncing code from
    // modifying local instances of the metri
    public func clone() -> RMetric {
        preconditionFailure("This method must be overriden by its children");
    }
    
    // Returns if the metric has been modified, this can be overriden by classes like RCalculation
    // that don't support modified/unmodified states
    public func isModified() -> Bool {
        return modified;
    }
    
    // RMetrics support a wide range of values (booleans, numbers, etc). This will output the value
    // of the metric as a string if the metric  stores a NUMERICAL value. This method (I think) is only
    // used by the RCalculation metric
    public func toString() -> String {
        preconditionFailure("This method must be overriden by its children");
    }
    
}
