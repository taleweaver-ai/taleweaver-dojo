// Generated by dojo-bindgen on Sat, 24 Feb 2024 21:46:30 +0000. Do not modify this file manually.
using System;
using Dojo;
using Dojo.Starknet;

// Type definition for `dojo_starter::models::position::Vec2` struct
[Serializable]
public struct Vec2 {
    public uint x;
    public uint y;
}


// Model definition for `dojo_starter::models::position::Position` model
public class Position : ModelInstance {
    [ModelField("player")]
    public FieldElement player;

    [ModelField("vec")]
    public Vec2 vec;

    // Start is called before the first frame update
    void Start() {
    }

    // Update is called once per frame
    void Update() {
    }
}
        