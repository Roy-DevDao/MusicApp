using System;
using System.Collections.Generic;

namespace AppMediaMusic.DAL.Entities;

public partial class UserProfie
{
    public int UserId { get; set; }

    public string FullName { get; set; } = null!;

    public DateOnly Bỉth { get; set; }

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
